$ErrorActionPreference = 'Stop'

try {
    if (Get-Process -Name 'Revit' -ErrorAction SilentlyContinue) {
        $message = 'Revit is running. Close Revit, then run this routine again. No cache files were deleted.'
        Write-Host $message
        try {
            # Enumerate interactive sessions through the Terminal Services API, including console and RDP.
            if (-not ('PDQRevitSessionNative' -as [type])) {
                Add-Type -TypeDefinition @'
using System;
using System.Runtime.InteropServices;

public static class PDQRevitSessionNative
{
    [StructLayout(LayoutKind.Sequential, CharSet = CharSet.Unicode)]
    public struct WTS_SESSION_INFO
    {
        public int SessionId;
        [MarshalAs(UnmanagedType.LPWStr)] public string WinStationName;
        public int State;
    }

    [DllImport("wtsapi32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    public static extern bool WTSEnumerateSessions(IntPtr server, int reserved, int version, out IntPtr sessions, out int count);

    [DllImport("wtsapi32.dll", CharSet = CharSet.Unicode, SetLastError = true)]
    public static extern bool WTSQuerySessionInformation(IntPtr server, int sessionId, int infoClass, out IntPtr buffer, out int bytesReturned);

    [DllImport("wtsapi32.dll")]
    public static extern void WTSFreeMemory(IntPtr memory);
}
'@ -ErrorAction Stop
            }
            $sessions = [IntPtr]::Zero
            $count = 0
            if (-not [PDQRevitSessionNative]::WTSEnumerateSessions([IntPtr]::Zero, 0, 1, [ref]$sessions, [ref]$count)) {
                throw "Unable to enumerate interactive sessions (Windows error $([Runtime.InteropServices.Marshal]::GetLastWin32Error()))."
            }
            try {
                $sessionIds = @()
                $entrySize = [Runtime.InteropServices.Marshal]::SizeOf([type][PDQRevitSessionNative+WTS_SESSION_INFO])
                for ($i = 0; $i -lt $count; $i++) {
                    $entryPtr = [IntPtr]::Add($sessions, $i * $entrySize)
                    $entry = [Runtime.InteropServices.Marshal]::PtrToStructure($entryPtr, [type][PDQRevitSessionNative+WTS_SESSION_INFO])
                    if ($entry.State -ne 0 -or $entry.SessionId -eq 0) { continue }
                    $userBuffer = [IntPtr]::Zero
                    $bytes = 0
                    try {
                        if (-not [PDQRevitSessionNative]::WTSQuerySessionInformation([IntPtr]::Zero, $entry.SessionId, 5, [ref]$userBuffer, [ref]$bytes)) {
                            Write-Host "Could not identify user for session $($entry.SessionId) (Windows error $([Runtime.InteropServices.Marshal]::GetLastWin32Error()))."
                            continue
                        }
                        $userName = [Runtime.InteropServices.Marshal]::PtrToStringUni($userBuffer)
                        if (-not [string]::IsNullOrWhiteSpace($userName)) { $sessionIds += $entry.SessionId }
                    } finally {
                        if ($userBuffer -ne [IntPtr]::Zero) { [PDQRevitSessionNative]::WTSFreeMemory($userBuffer) }
                    }
                }
            } finally {
                if ($sessions -ne [IntPtr]::Zero) { [PDQRevitSessionNative]::WTSFreeMemory($sessions) }
            }
            if ($sessionIds.Count -eq 0) {
                Write-Host 'No active signed-in interactive user sessions were identified; no dialog was sent.'
            } else {
                $msgPath = Join-Path -Path $env:WINDIR -ChildPath 'System32\msg.exe'
                foreach ($sessionId in $sessionIds) {
                    try {
                        $msgOutput = & $msgPath "$sessionId" '/time:60' $message 2>&1
                        if ($LASTEXITCODE -ne 0) {
                            Write-Host "Notification delivery failed for session $sessionId (exit code $LASTEXITCODE): $($msgOutput -join ' ')"
                        } else {
                            Write-Host "Notification sent to session $sessionId."
                        }
                    } catch {
                        Write-Host "Notification delivery failed for session $sessionId : $($_.Exception.Message)"
                    }
                }
            }
        } catch {
            Write-Host "Could not notify interactive users: $($_.Exception.Message)"
        }
        exit 1
    }

    $profiles = @(Get-CimInstance -ClassName Win32_UserProfile -ErrorAction Stop | Where-Object { -not $_.Special -and -not [string]::IsNullOrWhiteSpace($_.LocalPath) })
    $years = 2021, 2023, 2025, 2027
    $failed = $false

    function Remove-CacheContents {
        param([Parameter(Mandatory = $true)][string]$Path)

        foreach ($item in @(Get-ChildItem -LiteralPath $Path -Force -ErrorAction Stop)) {
            if (($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0) {
                Write-Host "Skipped reparse point: $($item.FullName)"
                $script:failed = $true
                continue
            }
            if ($item.PSIsContainer) {
                Remove-CacheContents -Path $item.FullName
                if (@(Get-ChildItem -LiteralPath $item.FullName -Force -ErrorAction Stop).Count -eq 0) {
                    Remove-Item -LiteralPath $item.FullName -Force -ErrorAction Stop
                } else {
                    Write-Host "Could not fully clear directory: $($item.FullName)"
                    $script:failed = $true
                }
            } else {
                Remove-Item -LiteralPath $item.FullName -Force -ErrorAction Stop
            }
        }
    }

    foreach ($profile in $profiles) {
        $profilePath = $profile.LocalPath
        foreach ($year in $years) {
            $segments = @('AppData', 'Local', 'Autodesk', 'Revit', "Autodesk Revit $year", 'CollaborationCache')
            $currentPath = $profilePath
            $skip = $false
            try {
                $profileItem = Get-Item -LiteralPath $currentPath -Force -ErrorAction Stop
                if (-not $profileItem.PSIsContainer -or ($profileItem.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0) {
                    Write-Host "Skipped unsafe profile path: $currentPath"
                    $failed = $true
                    continue
                }
                foreach ($segment in $segments) {
                    $currentPath = Join-Path -Path $currentPath -ChildPath $segment
                    try {
                        $pathItem = Get-Item -LiteralPath $currentPath -Force -ErrorAction Stop
                    } catch [System.Management.Automation.ItemNotFoundException] {
                        Write-Host "Skipped missing path: $currentPath"
                        $skip = $true
                        break
                    }
                    if (-not $pathItem.PSIsContainer -or ($pathItem.Attributes -band [System.IO.FileAttributes]::ReparsePoint) -ne 0) {
                        Write-Host "Skipped unsafe path: $currentPath"
                        $failed = $true
                        $skip = $true
                        break
                    }
                }
                if ($skip) { continue }
                $failedBefore = $failed
                Remove-CacheContents -Path $currentPath
                if (@(Get-ChildItem -LiteralPath $currentPath -Force -ErrorAction Stop).Count -eq 0) {
                    Write-Host "Cleared contents: $currentPath"
                } else {
                    Write-Host "Cleanup incomplete: $currentPath"
                    $failed = $true
                }
            } catch {
                $failed = $true
                Write-Host "Error cleaning $currentPath : $($_.Exception.Message)"
            }
        }
    }

    if ($failed) {
        Write-Host 'The cleanup did not complete for every folder. Review the errors before opening Revit.'
        exit 1
    }
    Write-Host 'The Revit cache cleanup is complete. You can open Revit again.'
    exit 0
} catch {
    Write-Host "Revit cache cleanup failed: $($_.Exception.Message)"
    exit 1
}
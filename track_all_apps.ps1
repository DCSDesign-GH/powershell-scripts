$vApps = @{ 'Photoshop' = 'Photoshop.exe'; 'InDesign' = 'InDesign.exe'; 'Illustrator' = 'Illustrator.exe'; 'Lightroom' = 'Lightroom.exe'; 'Media Encoder' = 'Adobe Media Encoder.exe'; 'Premiere Pro' = 'Adobe Premiere Pro.exe'; 'Premiere Rush' = 'Adobe Premiere Rush.exe'; 'SketchUp' = 'SketchUp.exe'; 'Bluebeam' = 'Revu.exe'; 'AutoCAD' = 'acad.exe'; 'Navisworks' = 'Navisworks.exe'; 'ReCap' = 'ReCap.exe'; 'ReCap Photo' = 'ReCapPhoto.exe'; 'Enscape' = 'Enscape.exe'; 'Revit' = 'revit.exe'; 'Lumion' = 'Lumion.exe' }
$sApps = @{ 'Acrobat Pro' = 'Acrobat.exe'; 'D5 Render' = 'D5Render.exe'; 'D5 Launcher' = 'D5_Launcher.exe'; 'Camtasia' = 'CamtasiaStudio.exe'; 'Newforma Project Center' = 'Newforma.exe'; 'Microsoft Edge' = 'msedge.exe'; 'Firefox' = 'firefox.exe'; 'Chrome' = 'chrome.exe'; 'Brave' = 'brave.exe'; '7-Zip' = '7zFM.exe'; 'Bulk Rename Utility' = 'BRU.exe'; 'GIMP 3' = 'gimp-3.exe'; 'Google Earth' = 'googleearth.exe'; 'SonicWall NetExtender' = 'NetExtender.exe'; 'MS Project' = 'WINPROJ.EXE' }
$regBase = "HKLM:\SOFTWARE\CustomSoftwareTracker"
$logFile = "C:\ProgramData\PDQ_Trackers\tracker_execution.log"

function Log-Tracker ($msg) {
    "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') | $msg" | Out-File -LiteralPath $logFile -Append -ErrorAction SilentlyContinue
}

Log-Tracker "--- App Usage Tracker Started ---"

if (-not (Test-Path -LiteralPath $regBase)) { New-Item -Path $regBase -Force | Out-Null }

# -----------------------------------------------------------------------------
# ONEDRIVE USER & PATH RESOLUTION
# -----------------------------------------------------------------------------
$targetUser = $null
$currentUser = $null

# 1. Query Active Explorer Process Owner
$explorerProc = Get-CimInstance Win32_Process -Filter "Name = 'explorer.exe'" -ErrorAction SilentlyContinue | Select-Object -First 1
if ($explorerProc) {
    $owner = Invoke-CimMethod -InputObject $explorerProc -MethodName GetOwner -ErrorAction SilentlyContinue
    if ($owner -and $owner.User) {
        $targetUser  = $owner.User
        $currentUser = "$($owner.Domain)\$($owner.User)"
    }
}

# Fallback to WMI ComputerSystem
if (-not $targetUser) {
    $currentUser = (Get-CimInstance -ClassName Win32_ComputerSystem).UserName
    if ($currentUser) { $targetUser = ($currentUser -split '\\')[-1] }
}

Log-Tracker "Resolved Active User: '$targetUser'"

$foundOneDrivePath = $null

if ($targetUser) {
    $expectedUserDir = "C:\Users\$targetUser"

    # Search loaded HKEY_USERS hives specifically matching the target user's profile
    $userSids = Get-ChildItem Registry::HKEY_USERS -ErrorAction SilentlyContinue | 
        Where-Object { $_.PSChildName -like "S-1-5-21-*" -and $_.PSChildName -notlike "*_Classes" }

    foreach ($sid in $userSids) {
        $accountsPath = "$($sid.PSPath)\Software\Microsoft\OneDrive\Accounts"
        if (Test-Path -LiteralPath $accountsPath) {
            $accounts = Get-ChildItem -LiteralPath $accountsPath -ErrorAction SilentlyContinue
            foreach ($acc in $accounts) {
                $pathVal = (Get-ItemProperty -LiteralPath $acc.PSPath -Name "UserFolder" -ErrorAction SilentlyContinue).UserFolder
                if ($pathVal -and $pathVal -like "$expectedUserDir\*" -and (Test-Path -LiteralPath $pathVal)) {
                    $foundOneDrivePath = $pathVal
                    break
                }
            }
        }
        if ($foundOneDrivePath) { break }
    }

    # Fallback: Direct user profile disk search
    if (-not $foundOneDrivePath -and (Test-Path -LiteralPath $expectedUserDir)) {
        $oneDriveDir = Get-ChildItem -LiteralPath $expectedUserDir -Directory -ErrorAction SilentlyContinue | 
            Where-Object { $_.Name -like "OneDrive*" } | Select-Object -First 1
        if ($oneDriveDir) { $foundOneDrivePath = $oneDriveDir.FullName }
    }
}

Log-Tracker "Resolved OneDrive Path: '$foundOneDrivePath'"

$backupFolderPath = $null
$backupFilePath   = $null

if ($foundOneDrivePath) {
    $backupFolderPath = Join-Path -Path $foundOneDrivePath -ChildPath "AppTracker_Backup"
    $backupFilePath   = Join-Path -Path $backupFolderPath -ChildPath "user_usage_history.json"
}

# -----------------------------------------------------------------------------
# RESTORE ENGINE: IMPORT FROM ONEDRIVE IF LOCAL REGISTRY IS EMPTY
# -----------------------------------------------------------------------------
$localKeys = Get-ChildItem -Path $regBase -ErrorAction SilentlyContinue
if ((-not $localKeys -or $localKeys.Count -eq 0) -and $backupFilePath -and (Test-Path -LiteralPath $backupFilePath)) {
    try {
        Log-Tracker "Local registry empty. Restoring usage history from OneDrive backup..."
        $jsonRaw = Get-Content -LiteralPath $backupFilePath -Raw -ErrorAction Stop | ConvertFrom-Json
        foreach ($prop in $jsonRaw.PSObject.Properties) {
            $appName = $prop.Name
            $appData = $prop.Value
            $appReg  = "$regBase\$appName"

            if (-not (Test-Path -LiteralPath $appReg)) { New-Item -Path $appReg -Force | Out-Null }

            Set-ItemProperty -Path $appReg -Name "TotalMinutes" -Value ([int]$appData.TotalMinutes) -Type DWord
            Set-ItemProperty -Path $appReg -Name "LastSeenRunning" -Value ([string]$appData.LastSeenRunning) -Type String
            Set-ItemProperty -Path $appReg -Name "LastUser" -Value ([string]$appData.LastUser) -Type String
        }
        Log-Tracker "Restore complete."
    } catch {
        Log-Tracker "Restore failed: $_"
    }
}

# -----------------------------------------------------------------------------
# REGISTRY UPDATE & SCAN FUNCTIONS
# -----------------------------------------------------------------------------
function Update-AppRegistry ($entryName, $addMinutes = 5) {
    $regPath = "$regBase\$entryName"
    if (-not (Test-Path -LiteralPath $regPath)) { New-Item -Path $regPath -Force | Out-Null }

    $currentMinutes = (Get-ItemProperty -Path $regPath -Name "TotalMinutes" -ErrorAction SilentlyContinue).TotalMinutes
    if ($null -eq $currentMinutes) { $currentMinutes = 0 }

    Set-ItemProperty -Path $regPath -Name "TotalMinutes" -Value ($currentMinutes + $addMinutes) -Type DWord

    if ($addMinutes -gt 0) {
        Set-ItemProperty -Path $regPath -Name "LastSeenRunning" -Value (Get-Date -Format "yyyy-MM-dd HH:mm:ss") -Type String
        if ($currentUser) { Set-ItemProperty -Path $regPath -Name "LastUser" -Value $currentUser -Type String }
    } 
    elseif (-not (Get-ItemProperty -Path $regPath -Name "LastSeenRunning" -ErrorAction SilentlyContinue)) {
        Set-ItemProperty -Path $regPath -Name "LastSeenRunning" -Value "Never" -Type String
        Set-ItemProperty -Path $regPath -Name "LastUser" -Value "None" -Type String
    }
}

function Format-AppVersionName ($friendlyName, $exePath) {
    $verInfo = [System.Diagnostics.FileVersionInfo]::GetVersionInfo($exePath)
    $versionLabel = ""

    if ($friendlyName -eq "Bluebeam") {
        $versionLabel = $verInfo.FileMajorPart
    }
    else {
        $metadataSearch = "$exePath $($verInfo.ProductName) $($verInfo.FileDescription)"
        if ($metadataSearch -match '\b(20\d\d)\b') {
            $versionLabel = $Matches[1]
        }
        elseif ($exePath -match 'acad\.exe$') {
            $versionLabel = $verInfo.FileMajorPart + 1995
        }
        else {
            $major = $verInfo.FileMajorPart
            if (-not $major -or $major -eq 0) {
                $major = ($verInfo.ProductVersion -split '\.')[0]
            }
            $versionLabel = $major
        }
    }
    return "$friendlyName $versionLabel"
}

function Get-InstalledVersionFromUninstallKey ($friendlyName) {
    $uninstallPaths = @(
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*",
        "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*"
    )
    $items = Get-ItemProperty $uninstallPaths -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like "*$friendlyName*" }
    foreach ($item in $items) {
        $searchStr = "$($item.DisplayName) $($item.DisplayVersion)"
        if ($searchStr -match '\b(20\d\d)\b') {
            return "$friendlyName $($Matches[1])"
        }
    }
    return $null
}

# 1. PROCESS VERSION-TRACKED APPS
foreach ($pair in $vApps.GetEnumerator()) {
    $procs = Get-CimInstance Win32_Process -Filter "Name LIKE '$($pair.Value)'" -ErrorAction SilentlyContinue
    if ($procs) {
        foreach ($proc in $procs) {
            if ($proc.ExecutablePath -and (Test-Path -LiteralPath $proc.ExecutablePath)) {
                $displayName = Format-AppVersionName $pair.Key $proc.ExecutablePath
                Update-AppRegistry $displayName -addMinutes 5

                $genericPath = "$regBase\$($pair.Key)"
                if (($displayName -ne $pair.Key) -and (Test-Path -LiteralPath $genericPath)) {
                    Remove-Item -Path $genericPath -Recurse -Force -ErrorAction SilentlyContinue
                }
            }
        }
    }
    else {
        $existingKeys = Get-ChildItem -Path $regBase -ErrorAction SilentlyContinue | Where-Object { $_.PSChildName -like "$($pair.Key) *" }
        if ($existingKeys) {
            foreach ($key in $existingKeys) {
                Update-AppRegistry $key.PSChildName -addMinutes 0
            }
        }
        else {
            $uninstallName = Get-InstalledVersionFromUninstallKey $pair.Key
            if ($uninstallName) {
                Update-AppRegistry $uninstallName -addMinutes 0
            }
            else {
                Update-AppRegistry $pair.Key -addMinutes 0
            }
        }
    }
}

# 2. PROCESS SIMPLE APPS
foreach ($pair in $sApps.GetEnumerator()) {
    $proc = Get-CimInstance Win32_Process -Filter "Name LIKE '$($pair.Value)'" -ErrorAction SilentlyContinue
    if ($proc) {
        Update-AppRegistry $pair.Key -addMinutes 5
    }
    else {
        Update-AppRegistry $pair.Key -addMinutes 0
    }
}

# -----------------------------------------------------------------------------
# BACKUP ENGINE: EXPORT LOCAL REGISTRY STATE TO ONEDRIVE
# -----------------------------------------------------------------------------
if ($backupFolderPath) {
    try {
        if (-not (Test-Path -LiteralPath $backupFolderPath)) {
            New-Item -ItemType Directory -Path $backupFolderPath -Force -ErrorAction Stop | Out-Null
            Log-Tracker "Created backup directory: '$backupFolderPath'"
        }

        $exportData = [ordered]@{}
        $subkeys = Get-ChildItem -Path $regBase -ErrorAction SilentlyContinue
        foreach ($key in $subkeys) {
            $appName = $key.PSChildName
            $props   = Get-ItemProperty -LiteralPath $key.PSPath -ErrorAction SilentlyContinue
            if ($props) {
                $exportData[$appName] = @{
                    "TotalMinutes"    = [int]$props.TotalMinutes
                    "LastSeenRunning" = [string]$props.LastSeenRunning
                    "LastUser"        = [string]$props.LastUser
                }
            }
        }

        if ($exportData.Count -gt 0) {
            $jsonString = $exportData | ConvertTo-Json -Depth 3
            Set-Content -LiteralPath $backupFilePath -Value $jsonString -Encoding UTF8 -Force -ErrorAction Stop
            Log-Tracker "Successfully exported registry state to: '$backupFilePath'"
        }
    } catch {
        Log-Tracker "Backup export failed: $_"
    }
} else {
    Log-Tracker "Backup skipped: Could not resolve target user's OneDrive path."
}

Log-Tracker "--- App Usage Tracker Finished ---"

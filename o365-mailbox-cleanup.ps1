# ------------------------------------------------------------------
# Exchange Mailbox Processing Tool
# ------------------------------------------------------------------

$Domain = "@dcsdesign.com"

# Search Criteria Base
$SearchStartDate = "2000-01-01"
$SearchEndDate   = $null
$SearchCriteria  = $null

# Snapshot Storage
$BeforeSizeGB = $null
$BeforeItemCount = $null
$AfterSizeGB = $null
$AfterItemCount = $null

function Get-MailboxUser {
    do {
        $user = Read-Host "Enter mailbox username (without domain)"
        $user = $user.Trim().ToLower()

        if ([string]::IsNullOrWhiteSpace($user)) {
            Write-Host "Username cannot be blank." -ForegroundColor Red
            continue
        }

        $mailbox = "$user$Domain"

        try {
            Get-Mailbox $mailbox -ErrorAction Stop | Out-Null
            return $mailbox
        }
        catch {
            Write-Host "Mailbox '$mailbox' not found. Try again." -ForegroundColor Red
        }
    } while ($true)
}

function Get-MailboxSizeSnapshot {
    try {
        $stats = Get-MailboxStatistics $MailboxUser
        $sizeString = $stats.TotalItemSize.ToString()

        if ($sizeString -match '\(([\d,]+) bytes\)') {
            $bytes = [int64]($Matches[1] -replace ',', '')
            $sizeGB = [math]::Round($bytes / 1GB, 2)
        }
        else {
            return $null
        }

        return @{
            SizeGB    = $sizeGB
            ItemCount = $stats.ItemCount
        }
    }
    catch {
        return $null
    }
}

function Get-RetentionStatus {
    try {
        $mbx = Get-Mailbox $MailboxUser
        $sir = $mbx.SingleItemRecoveryEnabled

        if ($mbx.RetainDeletedItemsFor) {
            try {
                $retain = ([timespan]$mbx.RetainDeletedItemsFor).Days
            }
            catch {
                $retain = $mbx.RetainDeletedItemsFor.ToString()
            }
        }
        else {
            $retain = "Default"
        }

        return "SIR Enabled: $sir | Retain Deleted: $retain days"
    }
    catch {
        return "Unable to retrieve retention settings"
    }
}

function Build-SearchCriteria {

    do {
        $inputDate = Read-Host "Enter END date (yyyy-mm-dd)"

        if ($inputDate -match '^\d{4}-\d{2}-\d{2}$') {
            try {
                [datetime]::ParseExact($inputDate, 'yyyy-MM-dd', $null) | Out-Null
                break
            }
            catch {
                Write-Host "Invalid date value." -ForegroundColor Red
            }
        }
        else {
            Write-Host "Date must be formatted yyyy-mm-dd." -ForegroundColor Red
        }
    } while ($true)

    $script:SearchEndDate  = $inputDate
    $script:SearchCriteria = "category:`"Filed by Newforma`" NOT category:`"Not Filed by Newforma`" received:$SearchStartDate..$SearchEndDate"

    Set-Clipboard -Value $SearchCriteria
}

function Show-Menu {

    Clear-Host
    $retentionStatus = Get-RetentionStatus

    Write-Host "==============================================" -ForegroundColor Cyan
    Write-Host " Exchange Mailbox Processing Menu"
    Write-Host "==============================================" -ForegroundColor Cyan
    Write-Host "Mailbox   : $MailboxUser" -ForegroundColor Yellow
    Write-Host "Retention : $retentionStatus" -ForegroundColor Gray

    if ($SearchCriteria) {
        Write-Host "Search    : $SearchCriteria" -ForegroundColor DarkGray
    }
    else {
        Write-Host "Search    : Not Set" -ForegroundColor DarkGray
    }

    if ($BeforeSizeGB -ne $null) {
        Write-Host "Before    : $BeforeSizeGB GB | Items: $BeforeItemCount" -ForegroundColor DarkGray
    }
    else {
        Write-Host "Before    : Not Captured" -ForegroundColor DarkGray
    }

    if ($AfterSizeGB -ne $null) {
        Write-Host "After     : $AfterSizeGB GB | Items: $AfterItemCount" -ForegroundColor DarkGray
    }
    else {
        Write-Host "After     : Not Captured" -ForegroundColor DarkGray
    }

    if (($BeforeSizeGB -ne $null) -and ($AfterSizeGB -ne $null)) {
        $deltaGB = [math]::Round(($AfterSizeGB - $BeforeSizeGB), 2)
        $deltaItems = $AfterItemCount - $BeforeItemCount

        if ($deltaGB -lt 0) { $color = "Green" }
        elseif ($deltaGB -gt 0) { $color = "Red" }
        else { $color = "Gray" }

        Write-Host "Change    : $deltaGB GB | Items: $deltaItems" -ForegroundColor $color

        if ($BeforeSizeGB -gt 0) {
            $recoveredPct = [math]::Round((($BeforeSizeGB - $AfterSizeGB) / $BeforeSizeGB) * 100, 2)
            Write-Host "Recovered : $recoveredPct %" -ForegroundColor $color
        }
    }

    Write-Host "==============================================" -ForegroundColor Yellow
    Write-Host "1. Open Mailbox in Outlook on the Web"
    Write-Host "2. Build & Copy Newforma Search Criteria"
    Write-Host "3. Disable Single Item Recovery (0 days)"
    Write-Host "4. Capture BEFORE Mailbox Snapshot"
    Write-Host "5. Reset SIR to Default (14 days)"
    Write-Host "6. Capture AFTER Mailbox Snapshot"
    Write-Host "7. View Recoverable Items Folder Statistics"
    Write-Host "8. Run Managed Folder Assistant"
    Write-Host "9. Start over with a new mailbox"
    Write-Host "0. Exit"
    Write-Host ""
}

# Initial mailbox selection
$MailboxUser = Get-MailboxUser

do {
    Show-Menu
    $choice = Read-Host "Select an option (1-0)"

    switch ($choice) {

        '1' {
            Start-Process "https://outlook.office.com/mail/$MailboxUser"
#            Read-Host "Press Enter to continue"
        }

        '2' {
            Build-SearchCriteria
            Write-Host "`nSearch criteria copied to clipboard." -ForegroundColor Green
#            Read-Host "Press Enter to continue"
        }

        '3' {
            Set-Mailbox $MailboxUser -SingleItemRecoveryEnabled:$False -RetainDeletedItemsFor (New-TimeSpan -Days 0)
#            Read-Host "Press Enter to continue"
        }

        '4' {
            $snap = Get-MailboxSizeSnapshot
            if ($snap) {
                $BeforeSizeGB = $snap.SizeGB
                $BeforeItemCount = $snap.ItemCount
            }
#            Read-Host "Press Enter to continue"
        }

        '5' {
            Set-Mailbox $MailboxUser -SingleItemRecoveryEnabled:$True -RetainDeletedItemsFor (New-TimeSpan -Days 14)
#            Read-Host "Press Enter to continue"
        }

        '6' {
            $snap = Get-MailboxSizeSnapshot
            if ($snap) {
                $AfterSizeGB = $snap.SizeGB
                $AfterItemCount = $snap.ItemCount
            }
#            Read-Host "Press Enter to continue"
        }

        '7' {
            Get-MailboxFolderStatistics $MailboxUser -FolderScope RecoverableItems |
                Format-List Name,FolderAndSubfolderSize,ItemsInFolderAndSubfolders
            Read-Host "Press Enter to continue"
        }

        '8' {
            Start-ManagedFolderAssistant $MailboxUser
#            Read-Host "Press Enter to continue"
        }

        '9' {
            $MailboxUser = Get-MailboxUser
            $BeforeSizeGB = $null
            $BeforeItemCount = $null
            $AfterSizeGB = $null
            $AfterItemCount = $null
            $SearchEndDate = $null
            $SearchCriteria = $null
        }

        '0' { }

        default {
            Write-Host "Invalid selection." -ForegroundColor Red
            Start-Sleep 1
        }
    }

} while ($choice -ne '0')

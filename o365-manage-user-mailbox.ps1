# Interactive Exchange Mailbox Management Script
# Will prompt for target mailbox(es) and allow the following tasks:
# 1. Add FullAccess Permission to a specified account
# 2. Show Current Mailbox Permissions
# 3. Set Quotas (with options for default, recommended, or manual values)
function Manage-Mailbox {
    do {
        # Clear-Host
        Write-Host "==========================================" -ForegroundColor Cyan
        Write-Host "     Exchange Mailbox Setup Tool          " -ForegroundColor Cyan
        Write-Host "==========================================" -ForegroundColor Cyan
        Write-Host ""

        # Prompts for target user email(s) or wildcard
        $UserInput = Read-Host "Enter Target Email(s) comma-separated, or '*' for ALL mailboxes"
        
        # Build array of target mailboxes
        $TargetMailboxes = @()
        if ($UserInput.Trim() -eq '*') {
            Write-Host "[i] Fetching all mailboxes in the organization..." -ForegroundColor DarkGray
            $TargetMailboxes = Get-Mailbox -ResultSize Unlimited | Select-Object -ExpandProperty PrimarySmtpAddress
        } else {
            $RawEntries = $UserInput -split ',' | ForEach-Object { $_.Trim() }
            foreach ($Entry in $RawEntries) {
                if ($Entry -and $Entry -notlike "*@*") {
                    $TargetMailboxes += "$Entry@dcsdesign.com"
                } elseif ($Entry) {
                    $TargetMailboxes += $Entry
                }
            }
        }

        # Menu Display
        Write-Host ""
        Write-Host "Select task(s) to perform (Separate multiple choices with commas, e.g., 1,3):" -ForegroundColor Yellow
        Write-Host "  1 - Add Mailbox Permission"
        Write-Host "  2 - Show Mailbox Permission"
        Write-Host "  3 - Set Quotas"
        Write-Host "  4 - Show Quotas"
        Write-Host "  Q - Quit"
        
        $Selection = Read-Host "Choice(s)"
        
        if ($Selection -eq 'Q' -or $Selection -eq 'q') {
            break
        }

        $Choices = $Selection -split ',' | ForEach-Object { $_.Trim() }

        # Check if AdminEmail is needed (required for Option 1)
        if ($Choices -contains '1') {
            Write-Host ""
            $AdminEmail = Read-Host "Enter Admin/Delegate Account needing access"
            if ($AdminEmail -notlike "*@*") {
                $AdminEmail = "$AdminEmail@dcsdesign.com"
            }
        }

        # Prompt once for quota choices if Option 3 selected
        $QuotaType = $null
        $IssueWarning = $null
        $ProhibitSend = $null
        $ProhibitSendReceive = $null

        if ($Choices -contains '3') {
            Write-Host "`nQuota Configuration Options:" -ForegroundColor Yellow
            Write-Host "  1 - Use Defaults (Warning: 98GB | Send: 99GB | Send/Receive: 100GB)"
            Write-Host "  2 - Recommended (Warning: 95GB | Send: 98.5GB | Send/Receive: 98GB)"
            Write-Host "  3 - Enter Manual Values"
            $QuotaType = Read-Host "Select Option (1, 2, or 3)"

            if ($QuotaType -eq '1') {
                $IssueWarning = "98GB"
                $ProhibitSend = "99GB"
                $ProhibitSendReceive = "100GB"
            } elseif ($QuotaType -eq '2') {
                $IssueWarning = "95GB"
                $ProhibitSend = "98GB"
                $ProhibitSendReceive = "98.5GB"
            } elseif ($QuotaType -eq '3') {
                $IssueWarning = Read-Host "Enter Issue Warning Quota (e.g., 95GB)"
                $ProhibitSend = Read-Host "Enter Prohibit Send Quota (e.g., 98GB)"
                $ProhibitSendReceive = Read-Host "Enter Prohibit Send/Receive Quota (e.g., 98.5GB)"
            }
        }

        # Array to collect objects for multiple-user quota table output
        $CollectedQuotas = @()

        # Process each resolved target mailbox
        foreach ($UserEmail in $TargetMailboxes) {
            # Write-Host "`n==========================================" -ForegroundColor DarkGray
            # Write-Host " Processing Target: $UserEmail" -ForegroundColor Yellow
            # Write-Host "==========================================" -ForegroundColor DarkGray

            # ----------------------------------------------------
            # OPTION 1: Add Mailbox Permission
            # ----------------------------------------------------
            if ($Choices -contains '1') {
                # Write-Host "`n[+] Adding FullAccess Permission for $AdminEmail on $UserEmail..." -ForegroundColor Green
                Add-MailboxPermission -Identity $UserEmail -User $AdminEmail -AccessRights FullAccess -AutoMapping $false
                
                # Auto-trigger Show Permissions if not explicitly selected
                if (-not ($Choices -contains '2')) {
                    $Choices += '2'
                }
            }

            # ----------------------------------------------------
            # OPTION 2: Show Mailbox Permission
            # ----------------------------------------------------
            if ($Choices -contains '2') {
                # Write-Host "`n[i] Fetching Current Mailbox Permissions for $UserEmail..." -ForegroundColor Cyan
                Get-MailboxPermission -Identity $UserEmail | Select-Object AccessRights, User | Format-Table
            }

            # ----------------------------------------------------
            # OPTION 3: Set Quotas
            # ----------------------------------------------------
            if ($Choices -contains '3') {
                # Write-Host "`n[i] Fetching Current Quotas for $UserEmail..." -ForegroundColor Cyan
                Get-Mailbox -Identity $UserEmail | Select-Object DisplayName, ProhibitSendQuota, ProhibitSendReceiveQuota, IssueWarningQuota | Sort-Object ProhibitSendQuota | Format-Table

                # Write-Host "`n[+] Applying Quotas to $UserEmail..." -ForegroundColor Green
                Set-Mailbox -Identity $UserEmail -IssueWarningQuota $IssueWarning -ProhibitSendQuota $ProhibitSend -ProhibitSendReceiveQuota $ProhibitSendReceive
                
                # Auto-trigger Show Quotas if not explicitly selected
                if (-not ($Choices -contains '4')) {
                    $Choices += '4'
                }
            }

            # ----------------------------------------------------
            # OPTION 4: Show Quotas
            # ----------------------------------------------------
            if ($Choices -contains '4') {
                # Write-Host "`n[i] Fetching Current/Updated Quotas for $UserEmail..." -ForegroundColor Cyan
                $QuotaData = Get-Mailbox -Identity $UserEmail | Select-Object DisplayName, ProhibitSendQuota, ProhibitSendReceiveQuota, IssueWarningQuota

                if ($TargetMailboxes.Count -gt 1) {
                    # Collect data for the consolidated table view if multiple targets exist
                    $CollectedQuotas += $QuotaData
                } else {
                    # Display as standard list for a single target
                    $QuotaData | Format-List
                }
            }
        }

        # Output consolidated table if Option 4 was active AND there were multiple targets
        if ($Choices -contains '4' -and $TargetMailboxes.Count -gt 1 -and $CollectedQuotas.Count -gt 0) {
            # Write-Host "`n==========================================" -ForegroundColor Cyan
            # Write-Host "         Consolidated Quota Report        " -ForegroundColor Cyan
            # Write-Host "==========================================" -ForegroundColor Cyan
            $CollectedQuotas | Sort-Object ProhibitSendQuota | Format-Table
        }

        Write-Host "`n==========================================" -ForegroundColor Cyan
        $LoopAgain = Read-Host "Do you want to process another request? (Y/N)"
        
    } while ($LoopAgain -eq 'Y' -or $LoopAgain -eq 'y')
}

# Run the routine
Manage-Mailbox
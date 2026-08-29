Import-Module ActiveDirectory
Add-Type -AssemblyName System.Windows.Forms

function Browse-OU {

    $ou = Get-ADOrganizationalUnit -Filter * |
    Select Name, DistinguishedName |
    Sort Name |
    Out-GridView -Title "Select an OU and Click OK" -PassThru

    if ($ou){
        return $ou.DistinguishedName
    }
    else{
        Write-Host "No OU selected"
        return $null
    }

}

function Get-UserSelection ($ExtraProps = @()) {

    $baseProps = @(
        "GivenName","Surname","DisplayName","Description","Office",
        "OfficePhone","EmailAddress","wWWHomePage","StreetAddress",
        "postOfficeBox","City","State","PostalCode","MobilePhone",
        "FacsimileTelephoneNumber","ipPhone","Title","Company","info",
        "pwdLastSet","PasswordNeverExpires","msDS-UserPasswordExpiryTimeComputed"
    )

    $props = $baseProps + $ExtraProps

    $DefaultOU = "OU=DCS Users,DC=dcsdesign,DC=com"

    Write-Host ""
    Write-Host "User Selection"
    Write-Host ""
    Write-Host "1 - Enter Single Username"
    Write-Host "2 - Enter Multiple Usernames"
    Write-Host "3 - All Enabled Users (Entire Domain)"
    Write-Host "4 - All Enabled Users (DCS Users OU)"
    Write-Host "5 - Browse for OU"
    Write-Host ""

    $choice = Read-Host "Select option"

    switch ($choice) {

        1 {
            $u = Read-Host "Enter Username"
            return Get-ADUser $u -Properties $props |
            Where {$_.Enabled -eq $true}
        }

        2 {
            $u = Read-Host "Enter usernames separated by comma"
            $list = $u -split ","
            return $list | ForEach {
                Get-ADUser $_.Trim() -Properties $props
            } | Where {$_.Enabled -eq $true}
        }

        3 {
            return Get-ADUser -Filter {Enabled -eq $true} -Properties $props
        }

        4 {
            return Get-ADUser `
            -Filter {Enabled -eq $true} `
            -SearchBase $DefaultOU `
            -SearchScope Subtree `
            -Properties $props
        }

        5 {

            $SelectedOU = Browse-OU

            if ($SelectedOU){
                return Get-ADUser `
                -Filter {Enabled -eq $true} `
                -SearchBase $SelectedOU `
                -SearchScope Subtree `
                -Properties $props
            }

        }

    }
}

function Get-OutputMode {

    Write-Host ""
    Write-Host "Output Options"
    Write-Host ""
    Write-Host "1 - Display on Screen (Table)"
    Write-Host "2 - Display on Screen (GridView)"
    Write-Host "3 - Export to CSV File"
    Write-Host ""

    $mode = Read-Host "Select option"
    return $mode
}

function Get-SavePath {

    $dialog = New-Object System.Windows.Forms.SaveFileDialog
    $dialog.Filter = "CSV File (*.csv)|*.csv"
    $dialog.ShowDialog() | Out-Null
    return $dialog.FileName
}

function PasswordExpirationReport {

    $users = Get-UserSelection @(
        "pwdLastSet",
        "PasswordNeverExpires",
        "msDS-UserPasswordExpiryTimeComputed"
    )

    $maxAge = (Get-ADDefaultDomainPasswordPolicy).MaxPasswordAge

    $data = foreach ($user in $users) {

        if ($user.PasswordNeverExpires){
            $expiryDate = "Never Expires"
        }
        elseif ($user.pwdLastSet -eq 0){
            $expiryDate = "Must Change At Next Logon"
        }
        else{

            $computed = $user."msDS-UserPasswordExpiryTimeComputed"

            if ($computed){
                $expiryDate = [datetime]::FromFileTime($computed)
            }
            else{
                $pwdSet = [datetime]::FromFileTime($user.pwdLastSet)
                $expiryDate = $pwdSet + $maxAge
            }

        }

        [pscustomobject]@{
            Name = $user.Name
            SamAccountName = $user.SamAccountName
            PasswordExpirationDate = $expiryDate
        }
    }

    Write-Host ""
    Write-Host "Sort by:"
    Write-Host "1 - Name"
    Write-Host "2 - Expiration Date"
    $sort = Read-Host "Select option"

    if ($sort -eq 2){
        $data = $data | Sort-Object PasswordExpirationDate
    }
    else{
        $data = $data | Sort Name
    }

    $output = Get-OutputMode

    if ($output -eq 1){
        $data | Format-Table -AutoSize
        Pause
    }
    elseif ($output -eq 2){
        $data | Out-GridView -Title "Password Expiration Report"
    }
    elseif ($output -eq 3){
        $path = Get-SavePath
        $data | Export-Csv $path -NoTypeInformation
    }

}


function EmailSignatureReport {

    $users = Get-UserSelection

    $data = foreach ($user in $users){

        [pscustomobject]@{

            FirstName     = $user.GivenName
            LastName      = $user.Surname
            DisplayName   = $user.DisplayName
            Description   = $user.Description
            Office        = $user.Office
            Telephone     = $user.OfficePhone
            Email         = $user.EmailAddress
            WebPage       = $user.wWWHomePage
            Street        = $user.StreetAddress
            POBox         = ($user.postOfficeBox -join "; ")
            City          = $user.City
            State         = $user.State
            Zip           = $user.PostalCode
            Mobile        = $user.MobilePhone
            Fax           = $user.FacsimileTelephoneNumber
            IPPhone       = $user.ipPhone
            JobTitle      = $user.Title
            Company       = $user.Company
            Notes         = $user.info

        }
    }

$output = Get-OutputMode

if ($output -eq 1){
    $data | Format-Table -AutoSize
    Pause
}
elseif ($output -eq 2){
    $data | Out-GridView -Title "Email Signature Information"
}
elseif ($output -eq 3){
    $path = Get-SavePath
    $data | Export-Csv $path -NoTypeInformation
}


}

do {

    Clear-Host
    Write-Host ""
    Write-Host "Active Directory Reporting Utility"
    Write-Host ""
    Write-Host "1 - Password Expiration Report"
    Write-Host "2 - Email Signature Info"
    Write-Host "Q - Quit"
    Write-Host ""

    $menu = Read-Host "Select Option"

    switch ($menu) {

        1 { PasswordExpirationReport }
        2 { EmailSignatureReport }

    }

}
until ($menu -eq "Q")

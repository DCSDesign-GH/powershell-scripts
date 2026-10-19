# Define the UNC paths using variables
$active = "\\dcs-fs\data-1\jf"
$archiveserver = "\\dcs-fs-archive\data-1\jf"
$archivetape = "\\dcs-fs\sys\archive"
$retrievals = "\\dcs-fs\data-1\jf\Archive Retrievals"
$newjf = "\\dcs-fs\sys\netutils\usage\newjf.txt"

# Get user input for the project number
$pnum = read-host -prompt "Enter a portion of the project number or project name (to search NEWJF) "

# Check if the project number exists in any of the UNC paths
$projectExists = $false

# Read the content of the text file
$fileContent = Get-Content -Path $newjf -Raw

# Check if the project number exists in the file content
if ($fileContent -match $pnum) {
	Select-String -path $newjf -Pattern $pnum | Select-Object Line -ExpandProperty Line
} else {
    Write-Host `n"Project $pnum was not found in the NEWJF.TXT file." -ForegroundColor Red
}

if (Test-Path (Join-Path $active $pnum*)) {
#    write-host "   ACTIVE PROJECTS (MAIN FOLDER)"
    Get-ChildItem -Directory -Path $active\$pnum* -ErrorAction SilentlyContinue | select-object Name,LastWriteTime,FullName | Sort-Object Name | Format-Table -Wrap -AutoSize
    $projectExists = $true
}

if (Test-Path (Join-Path $active $pnum*\$pnum*)) {
#    write-host "   ACTIVE PROJECTS (SUB FOLDERS)"
    Get-ChildItem -Directory -Path $active\$pnum*\$pnum* -ErrorAction SilentlyContinue | select-object Name,LastWriteTime,FullName | Sort-Object Name | Format-Table -Wrap -AutoSize
    $projectExists = $true
}

if (Test-Path (Join-Path $archiveserver $pnum*)) {
#    write-host "   ARCHIVE SERVER (MAIN FOLDER)"
    Get-ChildItem -Directory -Path $archiveserver\$pnum* -ErrorAction SilentlyContinue | select-object Name,LastWriteTime,FullName | Sort-Object Name | Format-Table -Wrap -AutoSize
    $projectExists = $true
}

if (Test-Path (Join-Path $archiveserver $pnum*\$pnum*)) {
#    write-host "   ARCHVIE SERVER (SUB FOLDERS)"
    Get-ChildItem -Directory -Path $archiveserver\$pnum*\$pnum* -ErrorAction SilentlyContinue | select-object Name,LastWriteTime,FullName | Sort-Object Name | Format-Table -Wrap -AutoSize
    $projectExists = $true
}

if (Test-Path (Join-Path $archivetape $pnum*\$pnum*)) {
#    write-host "   ARCHIVED TO TAPE"
    Get-ChildItem -Path $archivetape\$pnum\* -ErrorAction SilentlyContinue | select-object Name,LastWriteTime,FullName | Sort-Object -Descending LastWriteTime| Format-Table -Wrap -AutoSize
    $projectExists = $true
}

if (Test-Path (Join-Path $active $pnum*\$pnum*)) {
#    write-host "   ARCHIVE RETRIEVALS FOLDER"
    Get-ChildItem -Directory -Path $retrievals\$pnum* -ErrorAction SilentlyContinue | select-object Name,LastWriteTime,FullName | Sort-Object Name | Format-Table -Wrap -AutoSize
    $projectExists = $true
}
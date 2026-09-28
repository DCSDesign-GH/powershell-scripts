# Require in elevated mode
if (-not([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Warning "You need to have Administrator rights to run this script!`nPlease re-run this script as an Administrator in an elevated powershell prompt!"
    break
    }
    
[System.Console]::Clear()

# Display usage information
Write-Host -ForegroundColor Green "USAGE SYNTAX"
Write-Host -ForegroundColor Green "Enter the UNC path for the folder to move into Archive"
Write-Host -ForegroundColor Green "The \\dcs-fs\data-1 is already part of the routine and should not be entered"
Write-Host -ForegroundColor Red "Example: \JF\524543.00\524543.20 or \MKT\CONCEPT\Jmuth"
Write-Host ""
$projectPath = Read-Host -Prompt "Enter the UNC path after \\dcs-fs\data-1 exactly as it is on the network: "

# Extract the last part of the path
$projectName = (Split-Path -Path $projectPath -Leaf)
if (-not $projectName) {
    Write-Error "Invalid path provided. Please ensure it includes at least one folder."
    exit
}

# Prepare log file name
$todaysDate = Get-Date -Format 'yyyy-MM-dd'
$logName = "${todaysDate}_${projectName}_Active2Archive.txt"

# Paths for robocopy
$source = "\\dcs-fs\data-1$projectPath"
$destination = "\\dcs-fs-archive\data-1$projectPath"
$logFilePath = "\\dcs-fs\sys\ARCHIVE\$projectName\$logName"

# Check if source path exists
if (!(Test-Path -Path $source)) {
    Write-Error "The specified path '$source' does not exist. Please check the path and try again."
    exit
} else {
    Write-Host -ForegroundColor Green "Path '$source' is valid. Proceeding..."
}


# Verification prompt
Write-Host ""
Write-Host -ForegroundColor Yellow "Source Folder: $source"
Write-Host -ForegroundColor Green "Destination Folder: $destination"
$confirmation = Read-Host -Prompt "Do you want to proceed with the file move? (Yes/No)"
if ($confirmation -notin @("Yes", "yes", "Y", "y")) {
    Write-Host -ForegroundColor Red "Operation canceled by the user."
    exit
}

# Create archive log path
$archiveLogPath = "\\dcs-fs\sys\ARCHIVE\$projectName"
if (-not (Test-Path $archiveLogPath)) {
    try {
        New-Item -ItemType Directory -Path $archiveLogPath -ErrorAction Stop
        Write-Host "Folder created: $archiveLogPath"
    } catch {
        Write-Error "Failed to create folder: $archiveLogPath. Error: $_"
        exit
    }
} else {
    Write-Host "Folder already exists: $archiveLogPath"
}

# Generate a file listing grouped by folder and including file owner and file size (in MB)
Write-Host -ForegroundColor Cyan "Creating a list of source folder contents..."
try {
    $fileListing = Get-ChildItem -Path $source -Recurse -File -ErrorAction Stop | ForEach-Object {
        $owner = (Get-Acl -Path $_.FullName).Owner
        $fileSizeMB = [Math]::Round($_.Length / 1MB, 2)
        [PSCustomObject]@{
            Folder      = Split-Path -Path $_.FullName -Parent
            FileName    = $_.Name
            FileSizeMB  = "{0:N2} MB" -f $fileSizeMB
            LastWrite   = $_.LastWriteTime
            Owner       = $owner
        }
    }

    # Group the output by folder
    $groupedOutput = $fileListing | Group-Object -Property Folder

    # Write to file with folder groups
    $outputContent = foreach ($group in $groupedOutput) {
        "Folder: $($group.Name)"
        "====================================="
        $group.Group | Format-Table -Property FileName, FileSizeMB, LastWrite, Owner -AutoSize -Wrap | Out-String
        ""
    }
    $outputContent | Out-File -FilePath $logFilePath -Encoding UTF8

    Write-Host -ForegroundColor Green "File list saved to: $logFilePath"
} catch {
    Write-Error "Failed to create file listing for: $source. Error: $_"
    exit
}

# Start the process

Write-Host -ForegroundColor Yellow "Moving project files..."
robocopy $source $destination /e /move /xo /it /copy:datso /dcopy:t /zb /fft /r:5 /nc /x /v /mt:16 /tee

# Copy log file to archive location
Write-Host -ForegroundColor Green "Copying log file..."
$archiveDestination = "$destination\99_Archives"
if (-not (Test-Path $archiveDestination)) {
    New-Item -ItemType Directory -Path $archiveDestination -ErrorAction Stop
}
robocopy $archiveLogPath $archiveDestination $logName /copy:datso /nc /np

Write-Host -ForegroundColor Green "Process completed successfully."

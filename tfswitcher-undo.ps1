# Terraform exe folder path
$terraformPath = "C:\Users\user1\Documents\terraform\" #### Change Me

# TFSwitcher folder path
$tfswitcherPath = "C:\Users\user1\Documents\Code\tools\tfswitcher\" #### Change Me


function tfswitcher-undo {
    
    # Get the existing version
    $existingversion = terraform -version | Select-Object -First 1

    # Revert to previous
    Copy-Item -Path "$($tfswitcherPath)previous\terraform.exe" -Destination "$($terraformPath)"

    $previousversion = terraform -version | Select-Object -First 1
    Write-Host "The version has been reverted to $($previousversion) from $($existingversion)." -ForegroundColor Green
}
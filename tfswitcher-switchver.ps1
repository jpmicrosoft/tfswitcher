# Terraform exe folder path
$terraformPath = "C:\Users\user1\Documents\terraform\" #### Change Me

# TFSwitcher folder path
$tfswitcherPath = "C:\Users\user1\Documents\Code\tools\tfswitcher\" #### Change Me

function tfswitcher-switchver {
    $originalversion = terraform -version | Select-Object -First 1

    Write-Host "If you require a version that is not listed using the get-tflocalver please CTRL+C and use the download-tfver command. This will download and make available the required version." -ForegroundColor yellow
    $tfver = Read-Host -Prompt "Enter the Terraform version you want to switch too."
    # Move existing to previous folder
    Copy-Item -Path "$($terraformPath)terraform.exe" -Destination "$($tfswitcherPath)previous\"

    # Move required version into use
    Copy-Item -Path "$($tfswitcherPath)$($tfver)\terraform.exe" -Destination "$($terraformPath)"

    $newversion = terraform -version | Select-Object -First 1
    Write-Host "The version has been changed from $($originalversion) to $($newversion)." -ForegroundColor Green
}
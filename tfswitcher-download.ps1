# TFSwitcher folder path
$tfswitcherPath = "C:\Users\user1\Documents\Code\tools\tfswitcher\" #### Change Me

function tfswitcher-download {
    param (
      [PSDefaultValue(Help = 'amd64')]
      $cpu = "amd64"
  )
    $dlver = Read-Host -Prompt "Enter the Terraform version you want to download and unzip. Example: 0.15.5 or 1.2.7"
    #$cpu = Read-Host -Prompt "386 or amd64? Please enter as 386 or amd64."
    # 0.15.5 / terraform_0.15.5_windows_386.zip    0.15.5 / terraform_0.15.5_windows_amd64.zip or 1.2.6/terraform_1.2.6_windows_386.zip"
    Invoke-WebRequest -Uri "https://releases.hashicorp.com/terraform/$dlver/terraform_$($dlver)_windows_$($cpu).zip" -OutFile "$($tfswitcherPath)terraform_$($dlver)_windows_$($cpu).zip"
    cd "$($tfswitcherPath)"
    Rename-Item "$($tfswitcherPath)terraform_$($dlver)_windows_$($cpu).zip" -NewName "$($tfswitcherPath)$($dlver).zip" -force
    Expand-Archive ".\$($dlver).zip" -force
    remove-item ".\$($dlver).zip" -force
}
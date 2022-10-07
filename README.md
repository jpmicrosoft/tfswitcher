# tfswitcher
Handles switching Terraform versions in Windows.

### Requirements
- Terraform already existing and usable.
- Create a folder named ``previous`` inside the folder where the existing Terraform executable is located.
- Update the folling variables in the .ps1 files with the corresponing folder paths unique to your workstation.
    + $terraformPath - Example: ``` $terraformPath = "C:\Users\user1\Documents\terraform\" ```
    + $tfswitcherPath - Example: ``` $tfswitcherPath = "C:\Users\user1\Documents\Code\tools\tfswitcher\" ```
- Add the following code to your PowerShell profile<sup>1</sup>. Ensure you change the directory to point to where the functions are going to run execute from.

<sup>1</sup> Sometimes the [$Profile](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_profiles?view=powershell-7.2#the-profile-files) mentiones that a profile file exist but this may not be true and you may need to create one.

```
# Load tfswitcher custom functions
$tfswitcher = "$env:USERPROFILE\Documents\tools\tfswitcher" #### Change Me
Write-Host "Loading tfswitcher functions." -ForegroundColor Green
Write-Host "tfswitcher-download" -ForegroundColor Yellow
Write-Host "tfswitcher-localver" -ForegroundColor Yellow
Write-Host "tfswitcher-switchver" -ForegroundColor Yellow
Write-Host "tfswitcher-undo" -ForegroundColor Yellow
Write-Host "tfswitcher-help" -ForegroundColor Yellow
Get-ChildItem "$tfswitcher\*.ps1" | % { .$_ }
Write-Host ''
```
### Functions

#### ***tfswitcher-download.ps1***
This function downloads Terraform version to populate your tfswitch folder. Once the version are located and formated in the tfswitch folder they can be used.
#### ***tfswitcher-localver.ps1***
This function list existing avialble Terraform versions that can be used by the ``` tfswitcher-switchver``` function.
#### ***tfswitcher-switchver.ps1***
This function changes the existing Terraform into any avialble version.
#### ***tfswitcher-undo.ps1***
This function reverts to the last Terraform version used. This function can be executed after a ``` tfswitcher-switchver``` to revert to the previous Terraform version in use.
:exclamation: This function reverts only if at least one sucessfull ```tfswitcher-switchver``` has occured. Until then the previous folder will be empty and thus there will not be a version to revert too.

#### ***tfswitcher-help.ps1***
This function simply list the available functions, it helps when you are new to using tfswitcher.

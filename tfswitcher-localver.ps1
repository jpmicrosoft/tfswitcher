# TFSwitcher folder path
$tfswitcherPath = "C:\Users\user1\Documents\Code\tools\tfswitcher\" #### Change Me

function tfswitcher-localver {
    $getstartingpath = Get-location
     cd "$($tfswitcherPath)"
    ls | Select-Object Name | Where { $_.Name -notlike "*.ps1" }
    cd $getstartingpath
}
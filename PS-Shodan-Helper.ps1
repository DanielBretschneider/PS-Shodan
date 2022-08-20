# Script PS-Shodan-Helper.ps1
<# .SYNOPSIS
     This file holds general purpose functions which are needed for PS-Shodan. 
.DESCRIPTION
     Helper file for PS-Shodan
.NOTES
    Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
    Company    : Frequentis AG
.LINK
     https://github.com/DanielBretschneider/PS-Shodan
#>



<#
.Description
Checks if folder exists. If not than this function
attempts to create it.
#>
function check_if_folder_exists 
{
    param
    (
        $folder
    )

    if (!(Test-Path $folder))
    {
        New-Item -Type "Directory" -Path $folder
        log 0 "PS-Shodan-Helper.ps1 - check_if_folder_exists" "Folder '$folder' was created. "
    }
    else 
    {
        log 0 "PS-Shodan-Helper.ps1 - check_if_folder_exists" "Folder '$folder' existing. "
    }
}


<#
.Description
Checks if a certain file exists. If not than this function
attempts to create it.
#>
function check_if_file_exists 
{
    param
    (
        $file
    )

    if (!(Test-Path $file))
    {
        New-Item -Type "File" -Path $file
        log 0 "PS-Shodan-Helper.ps1 - check_if_file_exists" "File '$file' was created. "
    }
    else 
    {
        log 0 "PS-Shodan-Helper.ps1 - check_if_file_exists" "File '$file' existing. "
    }
}
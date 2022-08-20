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


#
# ------------- Functions -------------
#


<#
.Description
Prints formatted message#>
function msg
{
    # parameter
    param
    (
        $message
    )

    #print message to console
    Write-Host "[#] $message"
}


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


<#
.Description
Returns True if file is empty, otherwise False.
#>
function is_file_blank
{
    # necessary parameter
    param
    (
        $file
    )

    #check if empty
    If (!(Get-Content $file)) 
    {
        # file is blank
        return $True
    }
        
    # file contains something
    return $False
}


<#
.Description
Prints message and retourns user input
#>
function user_input 
{
    # necessary parameter
    param
    (
        $message
    )

    # get user input
    $user_input = Read-Host $message

    # return input
    return $user_input

}
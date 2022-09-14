# Script PS-ShodanFileOperations.ps1
<# 
.SYNOPSIS
     Contains functions for File and I/O operations
.DESCRIPTION
     This script defines function for the creation of files
     and folders. 
.NOTES
     Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
     Company    : Frequentis AG
#>

#
#  ------------- Imports ------------- 
#
. .\PS-ConsoleHandler.ps1

#
#  ------------- Functions ------------- 
#
function Create-File 
{
    <#
        .SYNOPSIS
            Create file in specific location ($location)
    #>

    # parameter file name
    param
    (
        # name of the file 
        [Parameter(Mandatory=$True)]
        [string] $filename
    )

    # create file if not already existing
    if (! (Test-Path -Path $filename))
    {
        New-Item -ItemType File -Path $filename
        Print-Msg -Text "File was created at '$filename'"
    }

}


function Create-Folder
{
    <#
        .SYNOPSIS
            Create file in specific location ($location)
    #>

    # parameter file name
    param
    (
        # name of the folder
        [Parameter(Mandatory=$True)]
        [string] $foldername
    )

    # create file if not already existing
    if (!(Test-Path -Path $foldername))
    {
        New-Item -ItemType Directory -Path $foldername
        Print-Msg -Text "Folder was created at '$foldername'"
    }
}


function CheckIfFileIsEmpty
{
    <#
        .SYNOPSIS
            Checks if a given file is empty (Length = 0)
    #>

    # parameter file name
    param
    (
        # name of the folder
        [Parameter(Mandatory=$True)]
        [string] $filename
    )

    # check file length attribute
    if ((Get-ChildItem -Path $KEY_FILE_PATH).Length -eq 0)
    {
        return $True
    }

    return $False
}


function Get-ShodanKey
{
    <#
        .SYNOPSIS
            If keyfile is empty then this method is called. 
            Asks user in terminal to input the Shodan API key
            and stores it in the keyfile.
    #>

    # user input
    $key = Read-Host "Please enter Shodan API key"

    # store content in keyfile
    Set-Content -Path $KEY_FILE_PATH -Value $key
    Print-Msg -Text "Key set successfully."
}


function Delete-ShodanKey
{
    <#
        .SYNOPSIS
            If entered key is wrong this method will delete it.
    #>

    # store content in keyfile
    Set-Content -Path $KEY_FILE_PATH -Value ''
    Print-Msg -Text "Key deleted successfully."
}
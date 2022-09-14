# Script PS-Shodan.ps1
<# 
.SYNOPSIS
     Tool for Retreiving Data from Shodan API.
.DESCRIPTION
     This tool is developed to get data from outer circle
     subsidiaries in order to automatically check their
     vulnerabilities, open ports, etc. 
.NOTES
     Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
     Company    : Frequentis AG
#>

#
#  ------------- CMD Arguments ------------- 
#

param 
(
    [Parameter(Mandatory=$False)]
    [string] $Hostlist
)


#
#  ------------- Imports ------------- 
#
. .\PS-ShodanFileOperations.ps1
. .\PS-ConsoleHandler.ps1
. .\PS-ShodanVars.ps1


#
#  ------------- Functions ------------- 
#

function Print-WelcomeMessage
{
    <#
        .SYNOPSIS
            Greets the user and prints different info.
            This function needs to be manually adjusted
            when addin new parameters!
    #>
    Print-Msg -Text "PS-Shodan $Version started"
}


function Get-ParameterCount
{
    <#
        .SYNOPSIS
            Since $Args.Count is always zero on my pc. 
            This is function does more or less the same.
    #>

    # create array with possible parameters
    $count = 0

    # check possible parameters and increment by one if not emtpy
    if (!($Hostlist -eq ""))
    {
        $count++
    }

    return $count
}


function Setup-PS-Shodan
{
    <#
        .SYNOPSIS
            Do the inital install or startup checks
    #>
    
    # Create PS-Shodan Folder
    Create-Folder -Foldername $ROOT_PATH

    # Create key file inside PS-Shodan folder
    Create-File -Filename $KEY_FILE_PATH

    # Check if keyfile is empty
    if (CheckIfFileIsEmpty -Filename $KEY_FILE_PATH)
    {
        Get-ShodanKey
    }

    # Check CMD Arguements
    Print-Msg "CMDArg Count: $(Get-ParameterCount)"
}


function Main
{
    <#
        .SYNOPSIS
            Main Method - called on startup
    #>

    # welcome message
    Print-WelcomeMessage

    # do initital install or startup checks
    Setup-PS-Shodan

}


#
#  ------------- Start of Program ------------- 
#
Main
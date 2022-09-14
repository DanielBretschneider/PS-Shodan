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
    [string] $IP,
    [Parameter(Mandatory=$False)]
    [string] $Hostlist,
    [Parameter(Mandatory=$False)]
    [AllowNull()]
    [string]$Show
)


#
#  ------------- Imports ------------- 
#
. .\PS-ShodanFileOperations.ps1
. .\PS-ConsoleHandler.ps1
. .\PS-ShodanVars.ps1
. .\PS-ShodanOperations.ps1


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
    if (!($IP -eq ""))
    {
        $count++
    }
    if (!($Show -eq ""))
    {
        $count++
    }

    return $count
}


function Evaluate-Action 
{
    <#
        .SYNOPSIS
            This function decides on the basis of given parameters
            which actions needs to be executed.
    #>

    # Check arguments and do your job
    # show / print something
    if ($Show -ne "")
    {
        switch ($Show) 
        {
            "apikey"    { Print-Msg "Your API key is: $(Get-ShodanApiKey)" }
            "info"      { Print-ShodanApiInfo }
            "help"      {  }
            Default { Print-Msg "'$Show' is not recongnized" }
        }
    }

    # print shodan info about specific ip
    if ($IP -ne "")
    {
        Print-InfoOnHost $IP
    }

    # read list of hosts and show info
    if ($Hostlist -ne "")
    {
        # read in list of host in txt file and print info
    }

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
}


function Print-HelpMessage
{
    <#
        .SYNOPSIS
            Prints help message
    #>
    Write-Host "Help"
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

    # Do something
    if ($(Get-ParameterCount) -eq 0)
    {
        <# Show the user all possible commands #>
        Print-HelpMessage
    }
    else 
    {
        <# Do something #>
        Evaluate-Action    
    }
    
}


#
#  ------------- Start of Program ------------- 
#
Main
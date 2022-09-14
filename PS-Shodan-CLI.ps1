# Script PS-Shodan-CLI.ps1
<# .SYNOPSIS
     Command Line Interface for PS-Shodan, Arguments and functionality.
.DESCRIPTION
     Implements the processing of arguments.
.NOTES
    Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
    Company    : Frequentis AG
.LINK
     https://github.com/DanielBretschneider/PS-Shodan
#>

#
# ------------- INCLUDES ------------- 
#
. C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-Variables.ps1
. C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-Logger.ps1
. C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-Helper.ps1
. C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-Operations.ps1

$apikey = get_api_key

#
# ------------- FUNCTIONS ------------- 
#

function start_cli
{
    param
    (
        $cmd
    )
   
    cli_one_argument_passed $($cmd)
    Write-Host $cmd
    
}


<#
.Description
Processes commands if number of arguments is one
#>
function cli_one_argument_passed
{
    # passed command
    param 
    (
        $cmd
    )

    # switch
    if ($cmd -eq "GetAPIInfo")
    {
        invoke_api_shodan_reqest $("https://api.shodan.io/api-info?key=$apikey")
    }
}
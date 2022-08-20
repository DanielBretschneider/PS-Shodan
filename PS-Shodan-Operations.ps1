# Script PS-Shodan-CLI.ps1
<# .SYNOPSIS
     Implements Shodan Functionality
.DESCRIPTION
     Processes API calls and formats results.
.NOTES
    Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
    Company    : Frequentis AG
.LINK
     https://github.com/DanielBretschneider/PS-Shodan
#>


function invoke_api_shodan_reqest
{
    # URL as mandatory parameter
    param
    (
        $uri
    )

    # try to request and return result
    try {
        $ReqFull = Invoke-WebRequest -uri $uri -Method Get
        Write-Host $ReqFull | convertfrom-json | convertto-json -depth 100 | ForEach-Object { [System.Text.RegularExpressions.Regex]::Unescape($_) }
    }
    catch {
        write-host "Could not get information for host $IP. Error was:  $($_.Exception.Message)"
        continue
    }

   
}
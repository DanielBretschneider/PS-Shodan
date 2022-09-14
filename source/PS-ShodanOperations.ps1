# Script PS-ShodanOperations.ps1
<# 
.SYNOPSIS
     This file is repsonsible for all shodan related operations.
.DESCRIPTION
     Communication and data processing from Shodan API is done here.
.NOTES
     Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
     Company    : Frequentis AG
#>


#
#  ------------- Functions ------------- 
#

function Get-ShodanApiKey 
{
    <#
        .SYNOPSIS
            Prints Shodan API Key inside keyfile
    #>

    # return content of key file
    Return Get-Content -Path $KEY_FILE_PATH
}


function PS-ShodanInvokeAPIRequest
{
    <#
        .SYNOPSIS
            invoke-webrequest to Shodan API Request 
            and return response as json data
    #>

    # param is URI
    param
    (
        $uri
    )

    # Invoke Webrequest
    $WebResponse = Invoke-WebRequest -URI $uri -Method Get | Select-Object -Expand content

    # convert data to JSON
    $JSON_data = $WebResponse | ConvertTo-JSON

    # return data
    return $JSON_data | ConvertFrom-Json
}



function Print-ShodanApiInfo
{
    <#
        .SYNOPSIS
    #>

    # print info
    Print-Msg "Action: Show Shodan Account and Usage Info"

    # Build API URI 
    $REQ_URI = "https://api.shodan.io/api-info?key=$(Get-ShodanApiKey)"

    # invoke webrequest
    $JSON_data = PS-ShodanInvokeAPIRequest $REQ_URI 

    # Print Infos
    Write-Host $JSON_data
}


function Print-InfoOnHost
{
    <#
        .SYNOPSIS
            Print info on specific host
    #>

    param 
    (
        $ip
    )
    
    # web request URI
    $REQ_URI = "https://api.shodan.io/shodan/host/$($ip)?key=$(Get-ShodanApiKey)"

    # invoke webrequest
    $JSON_data = PS-ShodanInvokeAPIRequest $REQ_URI

    # 
    Write-Host $JSON_data
}
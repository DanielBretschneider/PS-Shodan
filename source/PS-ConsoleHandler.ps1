# Script PS-ConsoleHandler.ps1
<# 
.SYNOPSIS
     This file is repsonsible for output of data and strings in console.
.DESCRIPTION
     This is only for astethic purposes. Mainly.
.NOTES
     Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
     Company    : Frequentis AG
#>

function Print-Msg 
{
    # parameter contains message
    param (
        [Parameter(Mandatory=$True)]
        [string]
        $Text
    )

    # print 
    Write-Host "[*] $Text"
}


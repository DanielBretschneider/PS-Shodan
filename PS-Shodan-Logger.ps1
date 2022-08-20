# Script PS-Shodan-Logger.ps1
<# .SYNOPSIS
     This file contains all functions and variables needed for logging. 
.DESCRIPTION
     Helper file for PS-Shodan, mostly needed during development process.
.NOTES
    Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
    Company    : Frequentis AG
.LINK
     https://github.com/DanielBretschneider/PS-Shodan
#>

#
# ------------- INCLUDES ------------- 
#
. "C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-Variables.ps1"


# ------------- Functions -------------

#
# log - print out and log informatuion
#
# 1st param: log level (0 = info, 1 = warning, 2 = error)
# 2nd param: name of function sending information
# 3rd param: message itself
# 
# Example: log 0 "functionname" "important message for developer"
#
function log
{
    # paramter
    param 
    (
        $loglevel,
        $functionname,
        $message
    )
    
    # print information
    # depending on log level
    # 0 = info
    if ($loglevel -eq 0) 
    {
        Write-Output "$LOG_INFO[$functionname] - $message"
        Add-Content $LOG_FILE_PATH "$LOG_INFO[$functionname] - $message"
    } 
    elseif ($loglevel -eq 1)
    {
        Write-Host "$LOG_WARNING[$functionname] - $message"
        Add-Content $LOG_FILE_PATH "$LOG_WARNING[$functionname] - $message"
    }
    elseif ($loglevel -eq 2)
    {
        Write-Host "$LOG_ERROR[$functionname] - $message"
        Add-Content $LOG_FILE_PATH "$LOG_ERROR[$functionname] - $message"
    }
}

#
# ------------- EOF ------------- 
#

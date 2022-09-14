# Script PS-ShodanVars.ps1
<# 
.SYNOPSIS
     Contains Constants used by PS-Shodan
.DESCRIPTION
     This file includes constants and other values and data used by
.NOTES
     Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
     Company    : Frequentis AG
#>

#
#  ------------- Constants ------------- 
#

# version of this program
$VERSION = "v1.1"

# PS-Shodan Root Path
$ROOT_PATH = "C:\Users\$env:Username\AppData\Roaming\PS-Shodan"

# Keyfile path (contains API Key for Shodan API)
$KEY_FILE_PATH = "$ROOT_PATH\keyfile.txt"
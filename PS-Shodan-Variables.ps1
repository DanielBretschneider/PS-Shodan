# Script PS-Shodan-Variables.ps1
<# .SYNOPSIS
     This file contains all variables needed.
.DESCRIPTION
     Helper file for PS-Shodan paths and directories can be manipulated here.
.NOTES
    Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
    Company    : Frequentis AG
.LINK
     https://github.com/DanielBretschneider/PS-Shodan
#>

#
# ------------ SCRIPT PATHS ------------
#
$PS_SHODAN_VARIABLES_SCRIPT = "C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-Variables.ps1"
$PS_SHODAN_LOGGER_SCRIPT = "C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-Logger.ps1"


#
# ------------ FOLDERS ------------
#

# Main folder for PS-Shodan, f.e. scan result file will be stored here
$PS_SHODAN_FOLDER_PATH = "C:\Users\$env:UserName\AppData\Roaming\PS-Shodan"

# Folder inside main folder, where targets can be defined in text-file-format (ip_addresses.txt, hosts.txt, domains.txt, etc.)
$PS_SHODAN_TARGET_FILES_PATH = "$PS_SHODAN_FOLDER_PATH\targets"

# List of all folder that must be created
$PS_SHODAN_FOLDER_LIST = @($PS_SHODAN_FOLDER_PATH, $PS_SHODAN_TARGET_FILES_PATH)



#
# ------------ FILES ------------
#

# Shodan API Key
$PS_SHODAN_KEY_FILE = "$PS_SHODAN_TARGET_FILES_PATH\apikey.txt"

# IP Addresses (one address per line)
$PS_SHODAN_IP_LIST = "$PS_SHODAN_TARGET_FILES_PATH\iplist.txt"

# IP Addresses (one address per line)
$PS_SHODAN_DOMAINS_LIST = "$PS_SHODAN_TARGET_FILES_PATH\domains.txt"

# IP Addresses (one address per line)
$PS_SHODAN_HOSTS_LIST = "$PS_SHODAN_TARGET_FILES_PATH\HOSTS.txt"

# Email credentials
$PS_EMAIL_CREDENTIAL_FILE = "$PS_SHODAN_TARGET_FILES_PATH\emailcredentials.txt"


# list of files defined above
$PS_SHODAN_FILES_LIST = @($PS_SHODAN_KEY_FILE, $PS_SHODAN_IP_LIST, $PS_SHODAN_DOMAINS_LIST, $PS_SHODAN_HOSTS_LIST, $PS_EMAIL_CREDENTIAL_FILE)



#
# ------------ LOGGING ------------
#
# logging variables, if IS_LOGGING_ACTIVE ist set to $False no logs will be written.
$IS_LOGGING_ACTIVE = $True

# path to log file
$LOG_FILE_PATH = "C:\Users\$env:UserName\Desktop\PS-Shodan\psshodanlog.log"

# get current date and datetime
$CURRENT_DATE = Get-Date -format s

# Log levels 
$LOG_INFO = "[INFO][$CURRENT_DATE]: "
$LOG_WARNING = "[WARNING][$CURRENT_DATE]: "
$LOG_ERROR= "[ERROR][$CURRENT_DATE]: "



#
# ------------ MISC ------------
#
$NEWLINE = "`n"
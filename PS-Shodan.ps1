# Script PS-Shodan.ps1
<# .SYNOPSIS
     PS-Shodan is a open source tool for performing Shodan API requests via Powershell, including automated scans that can be sent out via email. 
.DESCRIPTION
     Several goals are set up:
     * performing standard API requests and formatted Output
     * CMD-Arguemnts, f.e. PS-Shodan -Host 127.0.0.1
     * Save scan results in scan folder (%appdata%\PS-Shodan\mmyyyy, where 'm' stands for current month and 'y' for the present year.
        - Exact location C:\Users\%username%\AppData\Roaming\PS-Shodan
     * Perfom automated tests
     * optionally send scan results from automated test via email 

     IMPORTANT: Please enter API Key in C:\Users\%username%\AppData\Roaming\PS-Shodan\key.txt file!
.NOTES
     Author     : Daniel Bretschneider - daniel.bretschneider@frequentis.com
     Company    : Frequentis AG
.LINK
     https://github.com/DanielBretschneider/PS-Shodans
#>

#
#  ------------- CMD Arguments ------------- 
#
param
(
     [string]$command,
     [string]$target
)


#
# ------------- INCLUDES ------------- 
#
. C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-Variables.ps1
. C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-Logger.ps1
. C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-Helper.ps1
. C:\Users\$env:UserName\Desktop\PS-Shodan\PS-Shodan-CLI.ps1

#
# ------------- CODE ------------- 
#

<#
.Description
Print Version and datetime
#>
function print_welcom_message
{
     # start message
     Write-Host "$NEWLINE"
     log 0 "main" "PS-Shodan v1.1 started at $CURRENT_DATE"
}


<#
.Description
This function checks if needed folders and files are existing
#>
function create_files_and_folders
{
     # create log file
     create_log_file

     # check if %appdata%\PS-Shodan(\targets) is already created
     check_psshodan_folders
          
     # check if PS-Shodan files (key.txt, ips.txt, hosts.txt, domains.txt, filter.txt) are already created
     check_psshodan_files
}


<#
.Description
This function checks if %appdata%\PS-Shodan is existing, 
if not then the folder will simply be created.
#>
function create_log_file
{
     check_if_file_exists $LOG_FILE_PATH
}


<#
.Description
This function checks if %appdata%\PS-Shodan is existing, 
if not then the folder will simply be created.
#>
function check_psshodan_folders
{
     # iterate through $folder_list and create folder if not existing
     foreach ($folder in $PS_SHODAN_FOLDER_LIST)
     {
          # attempt to create folder if not existing
          check_if_folder_exists $folder
     }
}


<#
.Description
This function checks if %appdata%\PS-Shodan files are existing, 
if not then the files will be created, f.e. key.txt, ips.txt, hosts.txt, domains.txt, filter.txt
#>
function check_psshodan_files
{
     # iterate through $folder_list and create folder if not existing
     foreach ($file in $PS_SHODAN_FILES_LIST)
     {
          # attempt to create file if not existing
          check_if_file_exists $file
     }
}


<#
.Description
This function checks if %appdata%\PS-Shodan files are existing, 
if not then the files will be created, f.e. key.txt, ips.txt, hosts.txt, domains.txt, filter.txt
#>
function check_API_key
{
     # check if file is empty
     if (is_file_blank $PS_SHODAN_KEY_FILE)
     {
          # api key file is blank, now ask for the key
          $apikey = user_input "Please enter your Shodan API key"

          # Write api key to file
          $apikey | Out-File -FilePath $PS_SHODAN_KEY_FILE
          $SHODAN_API_KEY = Get-Content -Path $PS_SHODAN_KEY_FILE
     }
     else {
          log 0 "check_API_key" "API key was already entered to '$PS_SHODAN_KEY_FILE'"
     }

     # reset key
     $SHODAN_API_KEY = Get-Content -Path $PS_SHODAN_KEY_FILE
}


<#
.Description
Main function of starting point of PS-Shodan.
#>
function main 
{
     # welcome
     print_welcom_message
     
     # create folders and files needed for PS-Shodan
     create_files_and_folders

     # check if api key is existent
     check_API_key

     # start processing given arguments
     start_cli $command
}



#
# ------------- STARTING POINT ------------- 
#
main


#
# ------------- EOF ------------- 
#

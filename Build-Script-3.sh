#!/bin/bash

##############################################################################################################################
# Created by Kevin Edmond.
#
# This script is used to display various system information. There are 11 option available in the menu:
#   Currently logged users | Your shell directory | Home Directory
#   OS name & version | Current working directory | Number of users logged in
#   Hard disk information | CPU information | Memory information
#   File system information | Currently running process 
# 
# Each option runs the appropriate command to display the relevant information.
# 
# Please read README.md for full notes on script.
#
###############################################################################################################################



# Initate an array with options used for the menu
declare -a menu=("Currently logged users" "Your shell directory" "Home Directory" 
"OS name & version" "Current working directory" "Number of users logged in" 
"Hard disk information" "CPU information" "Memory information" 
"File system information" "Currently running process" "Quit")

# Set column length to display menu vertically
COLUMNS=12

# ENV variable used to provide custom prompt in select loop
PS3="Enter a number: "

# Select loop used to display menu, run commands for selected 
# option, reprompt user, and exit using "quit" option 
select opt in "${menu[@]}"; do
        case $opt in
          "Currently logged users")
                echo "Current logged on user: "
                w
                echo " "
                ;;
          "Your shell directory") 
                echo "Current shell directory: "
                echo $SHELL
                echo " "
                ;;
          "Home Directory") 
                echo "Current home directory: "
                echo $HOME
                echo " "
                ;;
          "OS name & version")
               echo "OS name and version: "
                grep -E "^(NAME|VERSION)=" /etc/os-release
                echo " "
                ;;
          "Current working directory")
                echo "Current working directory: "
                pwd
                echo " "
                ;;
          "Number of users logged in")
                echo "Number of logged in users: "
                users | wc -w
                echo " "
                ;;
          "Hard disk information")
                echo "Hard disk info: "
                df -H
                echo " "
                ;;
          "CPU information")
                echo "CPU info: "
                cat /proc/cpuinfo
                echo " "
                ;;
          "Memory information")
                echo "Memory info: "
                free -mt
                echo " "
                ;;
          "File System information")
                echo "File system info: "
               df -Th
                echo " "
                ;;
          "Currently running process")
                echo "Current running processes: "
                ps -aux
                echo " "
                ;;
          "Quit")
                echo "Exiting System Info Script..."
                sleep(3)
                break
                ;;
          *)
                echo "Invalid Option";; 
        esac
done


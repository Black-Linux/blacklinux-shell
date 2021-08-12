#!/usr/bin/env bash

version="1.0.1-Beta"
#uptodate="All packages are up to date. Nothing to do"

# Colors

red=$(echo -e '\e[31m')
green=$(echo -e '\e[32m')
yellow=$(echo -e '\e[1;33m')
unterscore=$(echo -e '\033[4m')
cyan=$(echo -e '\033[1m\e[36m')

reset=$(echo -e '\033(B\033[m')

# Colors

if [[ $1 = "add" ]]; then
    if [ "$EUID" -ne 0 ]
        then
            echo -e "${red}ERROR:${reset} You're not an root! Use sudo patter <command>"
        exit
    fi

    echo -e "[$red#$reset] Getting Package Meta-Data..."
    cp ${2} /etc/patter/cache
    cd /etc/patter/cache
    tar xfz ${2}
    rm ${2}
    cp -r * /
    cd /etc/patter/
    rm -r cache
    mkdir cache




else
if [[ $1 = "sync" ]]; then
    if [ "$EUID" -ne 0 ]
        then
            echo -e "${red}ERROR:${reset} You're not an root! Use sudo patter <command>"
        exit
    fi

    echo -e "${green}Getting Packages${reset}: http://dl.blacklinux.ga/patter/Packages"
    sleep 0.5
    echo -e "${green}Ok${reset}: http://dl.blacklinux.ga/patter/Packages"
    sleep 0.7

    upgradable=1
    if [[ $upgradable = 1 ]]; then
        msg_package_update="Package"
    else
        msg_package_update="Packages"
    fi
    echo -e "${yellow}Return${reset}: ${upgradable} ${msg_package_update} can be upgraded. Run patter show upgradable to see them"


else
if [[ $1 = "upgrade" ]]; then
    if [ "$EUID" -ne 0 ]
        then
            echo -e "${red}ERROR:${reset} You're not an root! Use sudo patter <command>"
        exit
    fi

    echo -e "${green}Upgrade${reset}: Checking for Upgrades..."
    sleep 1.2

    upgrade=1
    if [[ $upgrade = 1 ]]; then
        msg_package="Package"
    else
        msg_package="Packages"
    fi

    echo "${yellow}Return${reset}: ${upgrade} ${msg_package} will be upgraded."; echo "Continue? [Yes/No]"

    read -r continue_upgrade
    if [[ $continue_upgrade != "Yes" ]] && [[ $continue_upgrade != "yes" ]]  && [[ $continue_upgrade != "Y" ]]  && [[ $continue_upgrade != "y" ]]; then
        echo "Abort."
    fi
    sleep 0.6
    echo -e "${green}Downloading${reset}: Package 1 of 1: Patter 1.0.1-Beta from http://dl.blacklinux.ga/Patter/patter-1.0.1-beta-amd64.blb"
    sleep 7.1
    echo -e "Please wait..."
    sleep 2.4
    echo -e "${green}Installing${reset}: Package 1 of 1: Patter 1.0.1-Beta.."
    sleep 5.8
    echo -e "Setting up Patter (1.0.1-Beta)"
    sleep 0.6
    echo "${yellow}Return${reset}: All Packages was been upgraded. 1KB of additional disk space is used."



else
if [[ $1 = "version" ]]; then
    echo "Patter Version ${version}"


else
if [[ $1 = "build" ]]; then
    echo "${yellow}Building${reset}: Patter is Building your Bzt"
    echo "${yellow}Building${reset}: Saving as Bzt-Build.bzt"
    sleep 2
    if [[ ${2} = "" ]]; then
        echo -e "${red}Error${reset}: No files were specified"
        exit
    fi
    tar cfz Bzt-Build.bzt ${2}


else
if [[ $1 = "repair" ]]; then
    if [ "$EUID" -ne 0 ]
        then
            echo -e "${red}ERROR:${reset} You're not an root! Use sudo patter <command>"
        exit
    fi

    echo -e "${yellow}Reparing${reset}: Reparing your Patter Installation"
    

    cd /etc
    mkdir patter
    cd /etc/patter
    mkdir files
    mkdir cache
    mkdir repo
    touch mirrorlist
    sleep 5
    


else
    echo -e "${red}Patter - The ultimative Package Manager for the Blacklinux Distribution${reset}"
    echo -e "*******************************************************************"
    echo -e "patter add: Installs a package"
    echo -e "patter sync: Syncs the repository and checks if upgrades are available"
    echo -e "patter upgrade: Upgrades available Packages"
    echo -e "patter version: Returns the current version of Patter"
    echo -e "patter build: Building your Bzt Package"
    echo -e "patter repair: Reparing your Patter Installation"
    echo -e ""
    echo -e "${red}${unterscore}Where is Patter available?${reset}"
    echo -e "Patter is available on Blacklinux, and Debian Systems using version above 9."
    echo -e "You're always welcomed to try running the package manager on other systems like Ubuntu or Arch Linux."
    echo -e "It is recommended to test this in a virtual machine, as porting may cause damage to the system."
    echo -e ""
    echo -e "${cyan}${unterscore}Informations about Patter${reset}"
    echo -e "Version: ${version}"
    echo -e "${yellow}Important!${reset} To install, remove, or update a package, you need sudo permissons"
fi
fi
fi
fi
fi
fi
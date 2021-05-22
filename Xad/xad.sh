#!/bin/bash

# Variablen für die Farben

black=$(echo -e '\e[30m')
red=$(echo -e '\e[31m')
green=$(echo -e '\e[32m')
brown=$(echo -e '\e[33m')
blue=$(echo -e '\e[34m')
purple=$(echo -e '\e[35m')
cyan=$(echo -e '\033[1m\e[36m')
yellow=$(echo -e '\e[1;33m')
white=$(echo -e '\e[1;37m')
dark_gray=$(echo -e '\e[1;30m')
light_red=$(echo -e '\e[1;31m')
light_green=$(echo -e '\e[1;32m')
light_blue=$(echo -e '\e[1;34m')
light_purple=$(echo -e '\e[1;35m')
light_cyan=$(echo -e '\e[1;36m')
light_gray=$(echo -e '\e[37m')
orange=$(echo -e '\e[38;5;202m')
light_orange=$(echo -e '\e[38;5;214m')
bold=$(echo -e '\033[1m')
reset=$(echo -e '\033(B\033[m')
unterstrich=$(echo -e '\033[4m')

# Add Packages

if [[ $1 = "add" ]]; then

if [ "$EUID" -ne 0 ]
then
echo "${red}ERROR:${reset} You're not root! Use sudo xad @cmd"
exit
fi


echo -e "[$red*$reset] Getting Meta-Data of Repository"
sleep 0.5s
echo -e "[$green*$reset] Getted!"
sleep 1.32s
echo -e "[$yellow*$reset] Installing Package..."
sleep 1.422s
cd /root || return
cd xad-temp/ || return
unzip ${2}
chmod +x *
cp * /usr/bin/
rm /root/xad-temp/*

# Remove Packages

else
if [[ $1 = "remove" ]]; then

if [ "$EUID" -ne 0 ]
then
echo "${red}ERROR:${reset} You're not root! Use sudo xad @cmd"
exit
fi

echo -e "[$red*$reset] Removing Package..."
sleep 1.422s
cd /root/xad-files/ || return

else 

# Setting up

if [[ $1 = "setup" ]]; then

if [ "$EUID" -ne 0 ]
then
echo "${red}ERROR:${reset} You're not root! Use sudo xad @cmd"
exit
fi

if [ -d "/root/xad-temp" ]; then
    echo "The directory xad-files already exists. If you want to set up xad again, please run sudo rm -r /root/xad-files/."
    exit
    return
fi

echo -e "Setting up Xad"
echo -e "Log:
~$ cd /root/"
sleep 1
echo -e "~$ mkdir xad-temp"
sleep 1.4
echo -e "~$ mkdir xad-files"

cd /root/ || return
mkdir xad-temp
mkdir xad-files

# Usage

else
echo -e "${red}Xad-Package Manager - A lightweight Package Manager${reset}"
echo -e "***************************************************"
sleep 0.01
echo -e "xad add @package: Installs the given package"
echo -e "xad remove @package: removes the specified package (BETA)"
echo -e ""
echo -e "${unterstrich}${red}Where can I use xad?${reset}"
echo -e "Xad can currently be used on Blackware Linux, ArchLinux, and any Debian-based distro. "
echo -e "It is important that the shell is Bash, as Xad was written for ${bold}Bash-only${reset}."
echo -e ""
echo -e "${unterstrich}${cyan}More informations about Xad!${reset}"
echo -e "xad-version 0.1.2-b-u1"
echo -e "${red}Important!${reset} To install, remove, or update a package, you need sudo permissons"
echo -e ""
echo -e "${unterstrich}${green}How big is the repository?${reset}"
echo -e "There are currently 2 *.bpkg (Blackware Package) files available."
echo -e ""
echo -e "Blackware Inc."

fi
fi
fi

distroName1=$(lsb_release -d | awk '{print $2}')
distroName2=$(lsb_release -d | awk '{print $3}')
distroName3=$(lsb_release -d | awk '{print $4}')

echo "Distrobution: ${distroName1} ${distroName2} ${distroName3}"

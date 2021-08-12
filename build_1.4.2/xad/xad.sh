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
xad_version="0.46"


# Add Packages
if [[ $1 = "-a" ]]; then

if [ "$EUID" -ne 0 ]
then
echo "${red}ERROR:${reset} You're not root! Use sudo xad <command>"
exit
fi


echo -e "[$red#$reset] Getting Package Meta-Data..."
sleep 0.5s
echo -e "[$green#$reset] Getted!"
sleep 1.32s
echo -e "[$yellow#$reset] Installing Package..."
sleep 1.422s
cd /usr/xad/files/
unzip ${2}
chmod +x *
cp * /usr/bin/
mv * $(tr -dc A-Za-z0-9 </dev/urandom | head -c 25 ; echo '')
cp * /usr/xad/cache/
rm *

# Remove Packages

else
if [[ $1 = "-d" ]]; then

if [ "$EUID" -ne 0 ]
then
echo "${red}ERROR:${reset} You're not root! Use sudo xad <command>"
exit
fi

echo -e "[$red*$reset] Removing Package..."
sleep 1.422s
cd /usr/xad/cache || return
sleep 3
echo "Could not remove Package."

else 

# Setting up

if [[ $1 = "-S" ]]; then

if [ "$EUID" -ne 0 ]
then
echo "${red}ERROR:${reset} You're not root! Use sudo xad <command>"
exit
fi

if [ -d "/usr/xad/cache" ]; then
    echo "The directory xad.cache already exists. If you want to set up xad again, please run sudo rm -r /usr/xad/cache/."
    exit
    return
fi

echo -e "Setting up Xad"
echo -e "Log:
~$ cd /usr/bin/xad"
sleep 1
echo -e "~# mkdir cache"
sleep 1.4
echo -e "~# mkdir files"
sleep 2.992323232323
echo -e "~# touch mirrorlist.xad"

cd /usr/xad/ || return
mkdir cache
mkdir files
touch mirrorlist.xad
apt install git zip unzip wget -y

else

if [[ $1 = "-v" ]]; then
echo -e "Version: build-${xad_version}"

else
if [[ $1 = "-uG" ]]; then

if [ "$EUID" -ne 0 ]
then
echo "${red}ERROR:${reset} You're not root! Use sudo xad <command>"
exit
fi


echo -e "[$red#$reset] Getting Update-Data..."
sleep 0.9s
echo -e "[$green#$reset] Getted!"
sleep 1.56s
echo -e "[$yellow#$reset] Installing Package-Update..."
sleep 2.622s
cd /root || return
cd xad-temp/ || return
unzip ${2}
chmod +x *
cp * /usr/bin/
rm /root/xad-temp/*
sleep 2.542s
echo -e "[$yellow!$reset] Warning! Xad could not get the Update-List! This may be because of a bug"
sleep 0.433s
echo -e "[$yellow?$reset] Would you like to report the Bug? [Yes/No]:"
read report
sleep 0.5
echo -e "[$green#$reset] Package was updated!"

else

if [[ $1 = "-xU" ]]; then

if [ "$EUID" -ne 0 ]
then
echo "${red}ERROR:${reset} You're not root! Use sudo xad <command>"
exit
fi

cp "/mnt/c/Users/Julian/Desktop/Div/Blacklinux/BlackLinux Shell/build_1.4.1/xad/xad.sh" "/usr/xad/"
echo -e "[Log] Xad was updated"


else
if [[ $1 = "-rS" ]]; then

if [ "$EUID" -ne 0 ]
then
echo "${red}ERROR:${reset} You're not root! Use sudo xad <command>"
exit
fi

if [ -d "/usr/xad/repo" ]; then
    echo "Updating Xad Repository..."
    cd /usr/xad/
    sudo rm -r repo
    git clone https://github.com/Black-Linux/repo.git
    exit
    return
fi

echo "Getting Xad Repository..."
cd /usr/xad/ || return
git clone https://github.com/Black-Linux/repo.git

else
if [[ $1 = "-aR" ]]; then
echo "Adding Xad Repository..."
cd /usr/xad/
echo xad.mirror = ${2} > mirrorlist.xad



else
echo -e "${red}Xad-Package Manager - A lightweight Package Manager${reset}"
echo -e "***************************************************"
sleep 0.01
echo -e "xad -a <blb>: Installs the given Blacklinux-Bundle"
echo -e "xad -d <package-name>: removes the specified package (BETA)"
echo -e "xad -uG <blb>: Updates the given Blacklinux-Bundle"
echo -e "xad -v: Shows you the currently installed Xad Version"
echo -e "xad -S: Setting up Xad"
echo -e "xad -rS: Syncing Xad Repository"
echo -e "xad -aR <repository>: Adding Xad Repository"
echo -e ""
echo -e "${unterstrich}${red}Where can I use Xad?${reset}"
echo -e "Xad can currently be used on BlackLinux, Debian 9 or higher and Ubuntu 20.04 or higher"
echo -e "You're need Bash-5 or higher to run Xad. Otherwise Xad cannot install the packages!"
echo -e ""
echo -e "${unterstrich}${cyan}More informations about Xad!${reset}"
echo -e "xad-version: build-${xad_version}"
echo -e "${red}Important!${reset} To install, remove, or update a package, you need sudo permissons"
echo -e ""
echo -e "${unterstrich}${green}How big is the repository?${reset}"
echo -e "Likely infinitely large. You can create your own Blacklinux Bundles (in short blb) very easy. "
echo -e ""
echo -e "Blacklinux Distrobution - All rights reserved"

fi
fi
fi
fi
fi
fi
fi
fi
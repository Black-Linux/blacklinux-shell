#!/bin/bash

if [[ $1 = -i ]]
then
    echo -e "Checking Repositorys..."
    sleep 0.7
    sudo apt install $2
    sleep 0.2
    echo -e "Package ${2} was successfullied installed"

else
if [[ $1 = -r ]]
then
    echo -e "Removing Package ${2}"
    sleep 0.7
    sudo apt remove $2
    sleep 0.2
    echo -e "Package ${2} was successfullied removed"

else
if [[ $1 = -u ]]
then
    echo -e "Checking for Updates..."
    sleep 0.7
    sudo apt update
    sleep 0.2

else
if [[ $1 = -ug ]]
then
    echo -e "Checking for Updates..."
    sleep 1
    sudo apt upgrade

else
if [[ $1 = -l ]]
then
    echo -e "Listing all packages... This can take time"
    sleep 2.7
    apt list

else
if [[ $1 = -ar ]]
then
    echo -e "Removing all unused Packages now..."
    sleep 0.7
    sudo apt autoremove

else
if [[ $1 = -bwug ]]
then

    echo -e "Blackware Linux Upgrade."
    echo -e "It will now check for updates and then install the updates." 
    echo -e "The process does not take that long."
    echo -e "********************************************************"
    echo -e "Searching for Updates..."
    sleep 0.5
    echo -e "Checking Repositorys.."
    sleep 1.5
    echo -e "Connecting to http://mirror.blackware.com/blackware/releases/0-1/main update nonfree"
    sleep 1
    echo -e "hmm... it looks like there's no update avaible for Blackware..!"
    # echo -e "Installing Systemupdates..."
    # sleep 0.2
    # echo -e "This will take 123.21MB of Space."
    # sleep 0.2
    # echo -e "Getting Metadata 1 - 122"
    # sleep 0.2
    # echo -e "Downloading Metadata..."
    # sleep 0.4
    # echo -e "[*----------------------] 2%"
    # sleep 0.4
    # echo -e "[***--------------------] 6%"
    # sleep 0.4
    # echo -e "[*****-------------------] 22%"
    # sleep 0.4
    # echo -e "[********----------------] 35%"
    # sleep 0.4
    # echo -e "[************------------] 46%"
    # sleep 0.6
    # echo -e "[***************---------] 65%"
    # sleep 0.4
    # echo -e "[***************---------] 67%"
    # sleep 0.4
    # echo -e "[**********************--] 86%"
    # sleep 0.1
    # echo -e "[**********************--] 87%"
    # sleep 1
    # echo -e "[************************] 100%"
    # sleep 3
    # echo -e "Downloadspeed: ~11.5MB/s"
    # sleep 0.2
    # echo -e "Installing Updates... Please wait!"
    # sleep 11
    # echo -e "Finished! Use reload to reload your shell..!"
    # echo -e "What was installed..?"
    # echo -e "Systemupdate for Blackware Linux 0.1"
    # echo -e "Updated to Blackware 1 LTS"

else
if [[ $1 = -h ]]
then
    echo -e "\033[31mUsage of spm - The Simple Package Manager - Based on APT\033[0m"
    echo -e "********************************************************"
    sleep 0.5
    echo -e "spm -i <Package>: Installs a package"
    echo -e "spm -r <Package>: Removes a package"
    echo -e "spm -u: Searching for avaible Updates"
    echo -e "spm -ug: Upgrades Packages if there are avaible updates"
    echo -e "spm -l: Listing all avaible Packages"
    echo -e "spm -ar: Remove automatically all unused Packages"
    echo -e "spm -bwug: Upgrades complete Blackware's System"

else
    echo -e "\033[31mERROR:\033[0m Invalid option '${1}'"
    echo -e "Use spm -h for more Informations"
fi
fi
fi
fi
fi
fi
fi
fi
#!/bin/bash

if [[ $1 = -sd ]] || [[ $1 = --shutdown ]]
then
    echo -e "Your system will now shutdown..."
    sleep 2
    exec wsl.exe --shutdown

else
if [[ $1 = -rl ]] || [[ $1 = --reload ]]
then
    echo -e "Your Shell will now reloading..."
    sleep 2 
    clear
    exec bash
    
# Usage of ctl
else
    echo -e "\033[1m\033[31mUsage\033[0m
ctl -sd, --shutdown: shutdowns your WSL
ctl -rl, --reload: Reloads your WSL's shell
"
fi
fi

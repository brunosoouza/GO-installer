#!/bin/bash

source instalaGO.sh
source desinstalarGO.sh 

clear

echo "Install golang"

go env GOROOT > /dev/null 2>&1

if [[ $? -gt 0 ]];then
    instalarGO
else
    echo "you have already been installed GO in the following version: "
    go version
    echo -e "\n\nWhat do you want to do ?"
    echo "1. uninstall GO"
    echo -e "2. update GO \n"

    read -p "> " resposta
    
    case $resposta in 
    1) verificaAntesDeDesinstalar
    ;;
    2)  echo "updating GO"
        echo "removing current version of GO"
        desinstalarGO && echo "GO removed"
        instalarGO
    ;;
    *) exit ;;
    esac

fi
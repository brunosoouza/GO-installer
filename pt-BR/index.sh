#!/bin/bash

source instalaGO.sh
source desinstalarGO.sh 

clear

echo "Instalador golang"

go env GOROOT > /dev/null 2>&1

if [[ $? -gt 0 ]];then
    instalarGO
else
    echo "você ja tem o go instalado na seguinte versao: "
    go version
    echo -e "\n\no que deseja fazer ?"
    echo "1. desinstalar go"
    echo -e "2. atulaizar o go \n"

    read -p "> " resposta
    
    case $resposta in 
    1) verificaAntesDeDesinstalar
    ;;
    2)  echo "atualizando go"
        echo "removendo versao atual do go"
        desinstalarGO && echo "go removido"
        instalarGO
    ;;
    *) exit ;;
    esac

fi
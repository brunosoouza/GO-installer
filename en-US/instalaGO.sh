#!/bin/bash

confirguarNovoGo(){
    echo "choose the installation directory"
    echo "1. /opt"
    echo "2. /usr/local"
    read -p " default: /opt > " opcao
    
    case $opcao in
    1) sudo tar -C /opt -xzf `ls|grep go*.tar.gz | tail -1`
        echo export PATH="$"PATH:/opt/go/bin >> $HOME/.bashrc
        echo export GOPATH=$HOME/go >> $HOME/.bashrc
    ;;

    2) sudo tar -C /usr/local -xzf `ls|grep go*.tar.gz | tail -1`
        echo export PATH="$"PATH:/usr/local/go/bin >> $HOME/.bashrc
        echo export GOPATH=$HOME/go >> $HOME/.bashrc
    ;;

    *) sudo tar -C /opt -xzf `ls|grep go*.tar.gz | tail -1`
        echo export PATH="$"PATH:/opt/go/bin >> $HOME/.bashrc
        echo export GOPATH=$HOME/go >> $HOME/.bashrc
    ;;
    esac
}

configurarGoEncontrado(){
    echo "choose the installation directory"
    echo "1. /opt"
    echo "2. /usr/local"
    read -p " default: /opt > " opcao
    
    case $opcao in
    1)  sudo tar -C /opt -xzf `ls|grep go*tar.gz | tail -1`
        echo export PATH="$"PATH:/opt/go/bin >> $HOME/.bashrc
        echo export GOPATH=$HOME/go >> $HOME/.bashrc
        echo "ready GO installed check by typing 'go' in another terminal"
    ;;

    2)  sudo tar -C /usr/local -xzf `ls|grep go*.tar.gz | tail -1`
        echo export PATH="$"PATH:/usr/local/go/bin >> $HOME/.bashrc
        echo export GOPATH=$HOME/go >> $HOME/.bashrc
        echo "ready GO installed check by typing 'go' in another terminal"
    ;;

    *) sudo tar -C /opt -xzf `ls|grep go*.tar.gz | tail -1`
        echo export PATH="$"PATH:/opt/go/bin >> $HOME/.bashrc
        echo export GOPATH=$HOME/go >> $HOME/.bashrc
        echo "ready GO installed check by typing 'go' in another terminal"
    ;;

    esac
}

baixarGo(){
    echo tentando baixar go na versao $value
    sudo wget https://dl.google.com/go/go$value.linux-amd64.tar.gz

    if [[ $? -eq 0 ]];then
      confirguarNovoGo 
      else
      echo "Hearing a problem while downloading"
      echo "Make sure you typed an available version"
      echo "or your network connection"
    fi
}

modulosGo(){
    echo "Enter the version you want to install eg: 1.14 or"
    echo "Enter 0 to list available versions"
    read -p " version > " value

    case $value in
    0) echo -e "\n\nthe following versions are available below:\n\n"
    echo "1.13.9"
    echo "1.13.10"
    echo "1.14"
    echo "1.14.1"
    echo -e "1.14.2\n"
    modulosGo;;
    *) baixarGo ;;
    esac
}

instalarGO(){
    echo "Preparing for installation:"
    echo "Checking if the GO has already been downloaded in this directory ..."
    ls|grep go*.tar.gz > /dev/null 2>&1
    if [[ $? -gt 0 ]];then
    echo "GO not found"
    modulosGo
    else
        echo "A downloaded go package found"
        echo -n "Do you want to install ?" 
        encontrado=`ls|grep go*.tar.gz | tail -1`
        echo $encontrado
        read -p "[y/N] > " instalar

        case $instalar in 
        y)configurarGoEncontrado;;
        n)echo "Certainly this package will not be installed"
        sudo rm -r go*tar.gz
        modulosGo
        ;;
        *)echo "Certainly this package will not be installed"
        sudo rm -r go*tar.gz
        modulosGo
        ;;
        esac
    fi   
}

#!/bin/bash

desinstalarGO(){
    localgo=`go env GOROOT`
    sudo rm -r $localgo

    sed -i 's;export PATH=$PATH:'$localgo'/bin;;' ~/.bashrc
    sed -i 's;export GOPATH=/home/bmatheus/go;;' ~/.bashrc

}

verificaAntesDeDesinstalar(){
    echo "deseja realmente desistalar o go ?"

    read -p "[y/N] > " desinstalar

    case $desinstalar in 
    n) echo "ok ... processo interrompido o go ira continuar instalado";;
    y) echo "desinstalando go"
    desinstalarGO;;
    *)  echo "ok ... processo interrompido o go ira continuar instalado";;

esac
}
#!/bin/bash

desinstalarGO(){
    localgo=`go env GOROOT`
    sudo rm -r $localgo

    sed -i 's;export PATH=$PATH:.*go/bin;;' ~/.bashrc
    sed -i 's;export GOPATH=.*/go;;' ~/.bashrc
    sed -i 's;export.*GOPATH)/bin:$PATH;;' ~/.bashrc


}

verificaAntesDeDesinstalar(){
    echo "deseja realmente desistalar o GO ?"

    read -p "[y/N] > " desinstalar

    case $desinstalar in 
    n) echo "ok ... processo interrompido o GO ira continuar instalado";;
    y) echo "desinstalando go"
    desinstalarGO;;
    *)  echo "ok ... processo interrompido o GO ira continuar instalado";;

esac
}

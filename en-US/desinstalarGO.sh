#!/bin/bash

desinstalarGO(){
    localgo=`go env GOROOT`
    sudo rm -r $localgo

    sed -i 's;export PATH=$PATH:'$localgo'/bin;;' ~/.bashrc
    sed -i 's;export GOPATH=/home/bmatheus/go;;' ~/.bashrc

}

verificaAntesDeDesinstalar(){
    echo "do you really want to uninstall the GO ?"

    read -p "[y/N] > " desinstalar

    case $desinstalar in 
    n) echo "ok ... process interrupted GO will remain installed";;
    y) echo "uninstalling GO"
    desinstalarGO;;
    *)  echo "ok ... process interrupted GO will remain installed";;

esac
}
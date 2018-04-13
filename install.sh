#!/bin/bash

####################################
# Script to set up worker          #
####################################

function already_installed(){
    if [ $(which $1) ]
    then 
        return 0
    fi
}

function update_upgrade(){
    echo
    echo 'Update packages and upgrade system'
    #apt-get update -y
}

function install_curl(){
    already_installed curl
    if [ $? -eq 0 ]
    then 
        echo
        echo ">>>" curl is already installed
    else

        echo
        echo Installing curl
        #apt-get install curl
    fi
}

function install_git(){
    already_installed git
    if [ $? -eq 0 ]
    then 
        echo 
        echo ">>>" Git is already installed
    else
        echo
        echo 'Installing git'
        #apt-get install git -y
    fi
}

function install_node(){
    already_installed node
    if [ $? -eq 0 ]
    then 
        echo
        echo ">>>" Node already installed
    else
        echo
        echo 'Installing Node Source'
        #curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh

        echo
        echo 'Running Node Source script'
        #bash nodesource_setup.sh

        echo
        echo 'Installing NodeJS'
        #apt-get install nodejs
    fi

}

function install_build_essentials(){
    echo
    echo 'Installing Build Essentials'
    #apt-get install build-essential
}

function install_pm2(){
    echo
    echo 'Intalling PM2'
    #npm i -g pm2
}

update_upgrade
install_curl
install_git
install_node
install_build_essentials
install_pm2

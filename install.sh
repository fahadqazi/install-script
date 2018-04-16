#!/bin/bash

####################################
# Script to set up worker          #
####################################

USERNAME=origin-task-worker

function add_new_user(){
    if [ "$UID" -ne "$ROOT_UID" ]
    then
        echo "Must be root user to run this script"
        exit 1
    else
        grep -q "whoami" /etc/passwd
        if [ $? -eq $SUCCESS ]
        then
            echo "User $whoami already exists"
            exit 1
        else 
            sudo useradd --no-user-group --gid www-data --system --create-home \
                --shell /usr/sbin/nologin $USERNAME
            echo "Setting up Account"
        fi
    fi

}


function already_installed(){
    if [ $(which $1) ]
    then 
        return 0
    fi
}

function update_upgrade(){
    echo
    echo "${RED}Update packages and upgrade system"
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
        echo Installing git
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
        echo Installing Node Source
        #curl -sL https://deb.nodesource.com/setup_8.x -o nodesource_setup.sh

        echo
        echo Running Node Source script
        #bash nodesource_setup.sh

        echo
        echo Installing NodeJS
        #apt-get install nodejs
    fi

}

function install_build_essentials(){
    echo
    echo 'Installing Build Essentials'
    #apt-get install build-essential
}

function install_pm2(){
    already_installed pm2
    if [ $? -eq 0 ]
    then
        echo
        echo ">>>" PM2 is already installed
    else
        echo
        echo Intalling PM2
        #npm i -g pm2
    fi

}

update_upgrade
install_curl
install_git
install_node
install_build_essentials
install_pm2

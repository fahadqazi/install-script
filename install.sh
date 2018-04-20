#!/bin/bash

# TODO: remove comments
####################################
# Script to set up worker          #
####################################

#USERNAME="origin-task-worker"
#USERNAME="fahad"
USERNAME="origin-task-dispatcher"
ROOT_UID=1000

function program_is_installed(){
    local return_=1
    type $1 >/dev/null 2>&1 || { local return_=0; }
    echo "$return_"
}

function npm_package_is_installed(){
    local return_=1
    type $1 >/dev/null 2>&1 || { local return_=0; }
    echo "$return_"
}

function add_new_user(){

    if [ "$UID" -eq "$ROOT_UID" ]
    then
        echo "Must be root user to run this script"
        exit 1
    else
        if id "$USERNAME" >/dev/null 2>&1; then
            echo "User $USERNAME already exists"
            exit 1
        else 
            sudo useradd --no-user-group --gid www-data --system --create-home \
                --shell /usr/sbin/nologin $USERNAME
            echo "Setting up Account"
        fi
    fi
}

function update_upgrade(){
    echo
    echo "$Update packages and upgrade system"
    apt-get update -y
}

function install_curl(){
    res=$(program_is_installed curl)
    if [ "$res" -eq 1 ]
    then 
        echo
        echo ">>>" curl is already installed
    else

        echo
        echo Installing curl
        apt-get install curl -y
    fi
}

function install_node(){
    res=$(program_is_installed nodejs)

    if [ "$res" -eq 1 ]
    then 
        echo
        echo ">>>" Node already installed
    else
        echo Installing NodeJS
        curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
        sudo apt-get install -y nodejs
    fi
}

function install_pm2(){
    res=$(npm_package_is_installed pm2)
    echo "this result of pm2 isntall: $res"
# todo: error investigate
    if [ "$res" -eq 1 ]
    then
        echo
        echo ">>>" PM2 is already installed
    else
        echo
        echo Intalling PM2
        npm i -g pm2 -y
    fi
}

update_upgrade
install_curl
install_node
install_pm2
add_new_user

#!/bin/bash 

function add_new_user(){

    echo "arguent passed: $1"
    echo "UID: $UID"
    echo "ROOT_UID: $UID"

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
#            sudo useradd --no-user-group --gid www-data --system --create-home \
#                --shell /usr/sbin/nologin $USERNAME
            echo "Setting up Account"
        fi
    fi
}


add_new_user fahad

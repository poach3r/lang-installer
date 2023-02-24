#!/bin/bash

echo 'zh_CN.UTF-8 UTF-8' >> /etc/locale.gen

rm -rf /etc/locale.conf

touch /etc/locale.conf

echo '1. English'

echo '2. French'

echo '3. Spanish'

echo '4. German'

echo '5. Italian'

echo '6. Simplified Chinese'

read -p 'Select your language: ' lang

if [ $lang == '1' ]
then
    echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
fi

if [ $lang == '2' ]
then
    echo 'LANG=#fr_FR.UTF-8' >> /etc/locale.conf
fi 

if [ $lang == '3' ]
then
    echo 'LANG=es_ES.UTF-8' >> /etc/locale.conf
fi

if [ $lang == '4' ]
then
    echo 'LANG=de_DE.UTF-8' >> /etc/locale.conf
fi

if [ $lang == '5' ]
then
    echo 'LANG=it_IT.UTF-8' >> /etc/locale.conf
fi

if [ $lang == '6' ]
then
    echo 'LANG=zh_CN.UTF-8' >> /etc/locale.conf
fi

if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME

elif type lsb_release >/dev/null 2>&1; then
    OS=$(lsb_release -si)

elif [ -f /etc/lsb-release ]; then
    . /etc/lsb-release
    OS=$DISTRIB_ID

elif [ -f /etc/debian_version ]; then
    OS=Debian

else
    OS=$(uname -s)
fi

if [[ $OS == 'Arch Linux' ]]
then
    echo 'Installing For Arch...'
    pacman -S ttf-arphic-uming
fi

if [[ $OS == 'Debian' ]]
then
    echo 'Installing For Debian...'
    apt-get install ttf-arphic-newsung
fi

if [[ $OS == 'Fedora' ]]
then
    echo 'Installing For Fedora...'
    dnf install texlive-arphic-ttf
fi

echo 'Finishing Installation...'

sleep 10s

echo 'Success! You May Need to Restart Programs for Changes to Occur'

#!/bin/bash

# Init variables
Hostname=${1}
Locale=${2:-'en_US.UTF-8'}
TimeZone=${3:-'Europe/Zurich'}

# Check preconditions
if [ -z "${Hostname}" ]; then
    echo 'The Hostname is required.'
    exit 1
fi

# Configure the hostname
sudo hostnamectl set-hostname ${Hostname}

# Update the hosts file
sudo sed -i "s|^127.0.1.1.*|127.0.1.1 `hostname -s` ${Hostname}|" /etc/hosts

# Configure the locale
sudo update-locale LANG=${Locale} LC_ALL=${Locale}
sudo localectl set-locale LANG=${Locale}

# Configure the timezone
sudo timedatectl set-timezone ${TimeZone}

# Update your local package index
sudo apt-get update

# Install default packages
sudo apt-get -y install lynx
sudo apt-get -y install unzip

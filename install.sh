#!/bin/bash

# Configure the hostname
sudo hostnamectl set-hostname ${SYSTEM_FQDN}

# Update the hosts file
sudo sed -i "s|^127.0.1.1.*|127.0.1.1 `hostname -s` ${SYSTEM_FQDN}|" /etc/hosts

# Configure the locale
sudo update-locale LANG=${SYSTEM_LOCALE} LC_ALL=${SYSTEM_LOCALE}
sudo localectl set-locale LANG=${SYSTEM_LOCALE}

# Configure the timezone
sudo timedatectl set-timezone ${SYSTEM_TIMEZONE}

# Update your local package index
sudo apt-get update

# Install default packages
sudo apt-get -y install lynx
sudo apt-get -y install unzip

#!/bin/bash

# Copyright (C) 2016 Odaceo. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Init variables
SYSTEM_HOSTNAME=${1}
SYSTEM_LOCALE=${2:-'en_US.UTF-8'}
SYSTEM_TIMEZONE=${3:-'Europe/Zurich'}

# Check preconditions
if [ -z "${SYSTEM_HOSTNAME}" ]; then
    echo 'The Hostname is required.'
    exit 1
fi

# Configure the hostname
sudo hostnamectl set-hostname ${SYSTEM_HOSTNAME}

# Update the hosts file
sudo sed -i "s|^127.0.1.1.*|127.0.1.1 `hostname -s` ${SYSTEM_HOSTNAME}|" /etc/hosts

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

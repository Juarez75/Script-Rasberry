#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

GENERAL_DEPENDENCIES="git curl nginx"
DB_DEPENDENCIES="postgresql postgresql-contrib redis-server"

apt update -y && apt upgrade -y

echo "General dependencies installation..."
apt install $GENERAL_DEPENDENCIES

echo "Database dependencies installation..."
apt install $DB_DEPENDENCIES

echo "Installation of node 16..."
curl -sL https://deb.nodesource.com/setup_16.x | bash -
sudo apt install -y nodejs

echo "DONE"
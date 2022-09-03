#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

APP_DIR="/case_app"
FRONT_PATH="$APP_DIR/frontend"
BACK_PATH="$APP_DIR/backend"
NGINX_CONF="front.nginx.conf"

mkdir -p $APP_DIR

# Clone repositories
git clone https://github.com/Juarez75/tfe-frontend $FRONT_PATH
git clone https://github.com/Juarez75/tfe $BACK_PATH

# Nginx configuration
cp $NGINX_CONF /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/$NGINX_CONF /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-enabled/default
service nginx reload

# Front-end configuration
./update_front.sh

# Back-end configuration
./update_back.sh
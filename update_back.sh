#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

APP_DIR="/case_app"
BACK_PATH="$APP_DIR/backend"

cd $BACK_PATH
git pull
npm i && npm start

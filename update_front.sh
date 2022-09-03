#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

APP_DIR="/case_app"
FRONT_PATH="$APP_DIR/frontend"

cd $FRONT_PATH
git pull
npm i -f && npm run build

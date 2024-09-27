#!/bin/sh
set -e

WAYBARHOME="$XDG_CONFIG_HOME/waybar"
CONFIGFILE="config.jsonc"
STYLEFILE="style.css"

if [[ $1 ]]; then
  themedir="$WAYBARHOME/themes/$1"
  if [[ ! $themedir ]];then
    echo "can not find the theme"
    exit 1
  else
    ln -sf $themedir/$STYLEFILE $STYLEFILE
    ln -sf $themedir/$CONFIGFILE $CONFIGFILE
    echo "change waybar theme to $1"
    $WAYBARHOME/relaunch.sh
  fi
else
  echo "specify themes"
  exit 1
fi

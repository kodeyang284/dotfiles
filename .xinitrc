#!/bin/sh

#This function can disable laptop monitor jut use externel monitor
#xrandr --output eDP-1 --off --output HDMI-1 --auto

xset r rate 250 100;exec dwm;

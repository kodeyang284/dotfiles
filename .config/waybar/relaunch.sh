#!/usr/bin/env sh

if pgrep waybar; then
  killall waybar
fi
waybar >/dev/null & # Launch statusbar

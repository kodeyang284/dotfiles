#!/bin/bash
feh --bg-scale /usr/share/backgrounds/archlinux/gritty.png &&
dwmstatus 2>&1 > /dev/null &
xset r rate 250 100
picom &
fcitx5 &

#!/bin/bash
xset r rate 250 100
WALL_PAPER=~/Pictures/Wallpaper/pexels-christian-heitz-842711.jpg
feh --bg-scale $WALL_PAPER &&
dwmstatus 2>&1 > /dev/null &
picom &
fcitx5 &

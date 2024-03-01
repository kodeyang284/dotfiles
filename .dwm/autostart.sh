#!/bin/bash
WALL_PAPER=~/Pictures/Wallpaper/pexels-christian-heitz-842711.jpg
feh --bg-scale $WALL_PAPER &&
dwmstatus 2>&1 > /dev/null &
xset r rate 250 100
picom &
fcitx5 &

export PATH=$PATH:$HOME/.local/bin
if [ -z "$DISPALY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
xset r rate 250 100

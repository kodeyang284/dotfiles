if [ -z "$DISPALY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi

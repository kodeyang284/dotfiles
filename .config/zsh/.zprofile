## make sure the XDG home is setted
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/share:/usr/local/share"

export PATH=$PATH:$HOME/.local/bin
export EDITOR='vim'
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"

if [ -z "$DISPALY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
xset r rate 250 100

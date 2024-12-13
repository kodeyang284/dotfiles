## make sure the XDG home is setted
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/share:/usr/local/share"
export XDG_DESKTOP_DIR="$HOME/.Desktop"

#export PATH=$PATH:${$(find ~/.local/bin -type d -printf %p:)%%:}
export PATH="$PATH:$(find ~/.local/bin -type d | paste -s -d ':')"
export EDITOR='nvim'
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc":"$XDG_CONFIG_HOME/gtk-2.0/gtkrc.mine"
export GTK_RC_FILES="$XDG_CONFIG_HOME"/gtk-1.0/gtkrc
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker

export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export XAUTHORITY="$XDG_RUNTIME_DIR"/Xauthority

export PYTHON_HISTORY="$XDG_STATE_HOME/python/history"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHONUSERBASE="$XDG_DATA_HOME/python"

export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export KLAYOUT_HOME="$XDG_CONFIG_HOME/klayout"

export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="$XDG_CONFIG_HOME"/java
#export JAVA_OPTS="-Dhttps.proxyHost=127.0.0.1 -Dhttps.proxyPort=7890"

export GRIM_DEFAULT_DIR="$HOME/Pictures/grim"

if [ -z "$DISPALY" ] && [ "$XDG_VTNR" = 1 ]; then
  #exec startx &>/dev/null
  #exec Hyprland &>/dev/null
  exec sway &>/dev/null
  #exec waybar &>/dev/null
fi

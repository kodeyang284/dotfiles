expot PATH=$PATH:$HOME/.local/bin
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_DIRS="$XDG_DATA_HOME:/usr/share:/usr/local/share"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"

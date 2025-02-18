_prompt_basher_pwd() {
  local git_root current_dir
  if git_root=$(command git rev-parse --show-toplevel 2>/dev/null); then
    current_dir="${PWD#${git_root:h}/}"
  else
    current_dir=${(%):-%~}
  fi
  print -n "%B%F{magenta}${current_dir}%b"
}

setopt nopromptbang prompt{cr,percent,sp,subst}

_venv() {
  local venv
  if ! [[ -z $VIRTUAL_ENV ]]; then
    venv="($(basename $VIRTUAL_ENV)) "
  fi
  print -n "${venv}"
}

#PS1='[$(_venv)%B%(!:%F{red}:%F{green})%n%f%F{green}@%m%b%f:$(_prompt_basher_pwd)${(e)git_info[prompt]}%f%(!:#:$)] '
PS1='%F{red}[%f$(_venv)%B%(!:%F{cyan}:%F{yellow})%n%f%F{green}@%f%F{blue}%m%b%f $(_prompt_basher_pwd)%f%F{red}]%f%(!:#:$) '
RPS1='%(?::%F{red}$?)'

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS
# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v
export KEYTIMEOUT=5
# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

ZSH_AUTOSUGGEST_MANUAL_REBIND=1
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key

### zim plugings database dir settings
ZSHZ_DATA=${ZIM_HOME}/pugings/zsh-z

if [[ -f $ZDOTDIR/.aliasrc ]]; then
  source $ZDOTDIR/.aliasrc
fi

if [[ -f $ZDOTDIR/.projrc ]]; then
  source $ZDOTDIR/.projrc
fi

zstyle ':completion:*' cache-path "$ZDOTDIR/.zcompcache"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# awsome functions
#
fzf_cdhelper() {
  local fd_options fzf_options target
  fd_options=(
    -type d
  )

  fzf_options=(
    --height 40%
    --reverse
    --exit-0
  )
  target="$(find "${1:-$HOME}" "${fd_options[@]}" | fzf "${fzf_options[@]}")"
  cd "$target" || return 1
}


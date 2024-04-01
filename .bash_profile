#
# ~/.bash_profile
#

[[ -f "${XDG_CONFIG_HOME:-${HOME}/.bashrc}" ]] && \
  . ${XDG_CONFIG_HOME:-${HOME}}/.bashrc
exec zsh

#[[ -f ~/.zshenv ]] && exec zsh

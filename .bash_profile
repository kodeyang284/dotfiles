#
# ~/.bash_profile
#

BASHRC_HOME=$XDG_CONFIG_HOME/bash

[[ -f ${BASHRC_HOME:-${HOME}}/.bashrc ]] &&
	. $BASHRC_HOME/.bashrc

#exec zsh

#[[ -f ~/.zshenv ]] && exec zsh

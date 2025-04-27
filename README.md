# Dotfiles for kodeyang

TODO.

## archlinux set up

* 常用软件:
  * pacman -S  TODO

## cp files from remote to local 

* scp -r kodeyang@10.20.221.13:/home/kodeyang/ic_proj/uvm/Menus/ ./Doc
* docker run -it --hostname lizhen --ma;-address 02:42:ac:11:00:02 phyzli/ubuntu18.04_xfce4_vnc4server_synopsys

## thinkpad x1 carbon

* tpacpi-bat -s ST 1 79 # Start charging if battery below 79%
* tpacpi-bat -s SP 1 80 # Stop charging if battery above 80%
* tpacpi-bat -s IC 1 0  # Disable charging entirely

## misc

* zsh has the EXTENDED_GLOB option, so carfully use regxg


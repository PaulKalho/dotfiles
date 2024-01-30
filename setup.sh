#!/bin/bash

# With this script you should be able to setup all the configs on new
# systems.

# directories
export XDG_CONFIG_HOME="$HOME"/.config
mkdir -p "$XDG_CONFIG_HOME"/neofetch

# links
ln -sf "$PWD/.zshrc" "$XDG_CONFIG_HOME"/.zshrc
ln -sf "$PWD/neofetch/config.conf" "$XDG_CONFIG_HOME"/neofetch/config.conf
ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim

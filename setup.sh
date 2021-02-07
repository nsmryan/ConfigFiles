#!/bin/bash

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    mkdir -p ~/.vim/autoload/
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

if [ "$(expr substr $(uname -s) 1 7)" == "MSYS_NT" ]; then
    pacman -S tmux --noconfirm
elif [ "$(expr substr $(uname -s) 1 9)" == "CYGWIN_NT" ]; then
    echo "Cygwin installation through setup.exe"
fi

source base16-gruvbox-dark-soft.sh


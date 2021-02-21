#!/bin/bash

# install vim plugin manager
if [ ! -f ~/.vim/autoload/plug.vim ]; then
    mkdir -p ~/.vim/autoload/
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

# install tmux plugin manager
if [ ! -d ~/.tmux/plugins/tpm ]; then
    mkdir -p ~/.tmux/plugins
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

# detect OS and perform OS-specific commands
if [ "$(expr substr $(uname -s) 1 7)" == "MSYS_NT" ]; then
    pacman -S tmux ctags gdb make gcc --noconfirm
elif [ "$(expr substr $(uname -s) 1 9)" == "CYGWIN_NT" ]; then
    echo "Cygwin installation through setup.exe"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # assume pacman for now
    sudo pacman -S tmux ctags gdb base-devel --noconfirm
fi

# use nice color scheme
source base16-gruvbox-dark-soft.sh

# put .vimrc in home
cp ./.vimrc ~/

# put .tmux.conf in home
cp ./.tmux.conf ~/

# install se tool
cp se /usr/bin/

mkdir -p ~/.config/

# install plugins in a separate process...
vim -c ":PlugInstall" &



mkdir -p ~/.vim/autoload/
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

if [ "$(expr substr $(uname -s) 1 7)" == "MSYS_NT" ]; then
    pacman -S tmux tcl
elif [ "$(expr substr $(uname -s) 1 9)" == "CYGWIN_NT" ]; then
    echo "Cygwin installation through setup.exe"
fi

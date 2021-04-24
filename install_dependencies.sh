#!/bin/bash

# system dependencies
apt install build-essential cmake vim-nox python3-dev mono-complete vim-gtk

# move repo vimrc
cp vimrc ~/.vimrc

# install vim plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install vim plugins
vim +PluginInstall +qall

# compile youcompleteme for vim
cd ~/.vim/bundle/youcompleteme
python3 install.py --all

#!/bin/bash

# move repo vimrc
cp vimrc ~/.vimrc

# install vim plugin manager
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install vim plugins
vim +PluginInstall +qall



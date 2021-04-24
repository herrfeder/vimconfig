#!/bin/bash

# system dependencies
apt install build-essential cmake vim-nox python3-dev mono-complete vim-gtk

# adding youcompleteme
git clone https://github.com/ycm-core/YouCompleteMe.git /home/"$1"/.vim/bundle/youcompleteme

# compile youcompleteme for vim
cd /home/"$1"/.vim/bundle/youcompleteme
git submodule update --init --recursive
python3 install.py --all


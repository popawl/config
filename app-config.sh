#!/usr/bin/env bash
#===============================================================================
# Globals
#===============================================================================
BASE_REPO=https://code.savvysherpa.com/pisaacson

#===============================================================================
# Vim
#===============================================================================
# Pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors
cp ./pathogen.vim ~/.vim/autoload/

# Config
cp ./vimrc ~/.vimrc
cp ./pencil.vim ~/.vim/colors/

# Plugins
cd ..
git clone $BASE_REPO/vimfiles.git
cd ./vimfiles
git submodule update --init --recursive
rm -rf ./.git/
rm -rf ~/.vim/bundle/*
cp -r ./* ~/.vim/bundle/
cd ../config/
rm -rf ../vimfiles/

#===============================================================================
# Tmux
#===============================================================================
cp ./tmux.conf ~/.tmux.conf

#===============================================================================
# Bash
#===============================================================================
cp ./bashrc ~/.bashrc

#===============================================================================
# i3
#===============================================================================
mkdir -p ~/.config/i3
cp ./config ~/.config/i3/

#===============================================================================
# Xresources
#===============================================================================
cp ./Xresources ~/.Xresources

#===============================================================================
# xinitrc
#===============================================================================
cp ./xinitrc ~/.xinitrc

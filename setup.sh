#!/bin/bash

echo 'install neobundle(for vim)'
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

echo 'install antigen(for zsh)'
mkdir -p ~/.zsh/antigen
git clone https://github.com/zsh-users/antigen.git ~/.zsh/antigen

echo 'copy'
# dotfiles
cp ./.* ~/.
# xmonad
mkdir -p ~/.xmonad
cp ./xmonad.hs ~/.xmonad/.

echo 'finish'




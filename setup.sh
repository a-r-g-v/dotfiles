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

# binary
mkdir ~/.bin/

# peco
wget https://github.com/peco/peco/releases/download/v0.3.5/peco_linux_amd64.tar.gz
tar zxvf peco_linux_amd64.tar.gz
mv peco_linux_amd64/peco ~/.bin/.
rm peco_linux_amd64.tar.gz
rm peco_linux_amd64 -Rf

echo 'finish'




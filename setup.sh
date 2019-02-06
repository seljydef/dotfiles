#!/bin/bash

sudo apt update && sudo apt upgrade

sudo apt install zsh tmux

# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# pyenv
git clone git://github.com/yyuu/pyenv.git ~/.pyenv

sudo apt install -y git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev libffi-dev zlib1g-dev

CONFIGURE_OPTS="--enable-shared" pyenv install 3.7.0
pyenv global 3.7.0
pyenv rehash

# YouCompleteMe
sudo apt install -y build-essential cmake
~/.vim/plugged/YouCompleteMe/install.py
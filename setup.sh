#!/bin/bash

install_tools(){
  case "${OSTYPE}" in
    darwin*)
      brew update
      brew install zsh tmux reattach-to-user-namespace tig 
      ;;
    *)
      sudo apt update && sudo apt upgrade
      sudo apt install -u zsh tmux tig
  esac
}

install_python(){
  if [[ ! -e ${HOME}/.pyenv ]]; then
    case "${OSTYPE}" in
      darwin*)
        brew install zlib pyenv
        ;;

      *)
        git clone git://github.com/yyuu/pyenv.git ~/.pyenv
        sudo apt install -y git gcc make openssl libssl-dev libbz2-dev libreadline-dev libsqlite3-dev libffi-dev zlib1g-dev
    esac
  fi

  CONFIGURE_OPTS="--enable-shared" pyenv install 3.7.0
  pyenv global 3.7.0
  pyenv rehash
  pip install pipenv pylint mypy
}

install_go(){
  if [[ ! -e ${HOME}/.goenv ]]; then
    git clone https://github.com/syndbg/goenv.git ~/.goenv
  fi
  ~/.goenv/bin/goenv install 1.11.5
  ~/.goenv/bin/goenv global 1.11.5
  ~/.goenv/bin/goenv rehash
}

install_nodejs() {
  if [[ ! -e ${HOME}/.nvm ]]; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
  fi
  nvm install --lts
  nvm use --lts
}

install_youcompleteme(){
  case "${OSTYPE}" in
    darwin*)
      brew install cmake
      ;;

    *)
      sudo apt install -y build-essential cmake
  esac
  ~/.vim/plugged/YouCompleteMe/install.py --go-completer --ts-completer
}


install_tools
install_python
install_go
install_nodejs
install_youcompleteme

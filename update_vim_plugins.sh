#!/bin/bash

set -ex

cd ~/dotfiles/vim/bundle/

if [[ `uname` == "Darwin" ]]; then
  rm -rf *
else
  rm -rf --interactive=never *
fi

git submodule add https://github.com/Yggdroot/indentLine.git
git submodule add https://github.com/scrooloose/nerdtree.git
git submodule add https://github.com/tomtom/tcomment_vim.git
git submodule add https://github.com/tpope/vim-fugitive.git
git submodule add https://github.com/airblade/vim-gitgutter.git
git submodule add https://github.com/jelera/vim-javascript-syntax.git
git submodule add https://github.com/msanders/snipmate.vim.git
git submodule add https://github.com/bling/vim-airline.git
git submodule add https://github.com/bronson/vim-trailing-whitespace.git
git submodule add https://github.com/aclissold/lunarized-syntax.git

#!/bin/bash

set -ex

cd ~/dotfiles/vim/bundle/

rm -rf --interactive=never *

git clone https://github.com/Yggdroot/indentLine.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/tomtom/tcomment_vim.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/airblade/vim-gitgutter.git
git clone https://github.com/jelera/vim-javascript-syntax.git
git clone https://github.com/msanders/snipmate.vim.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/bronson/vim-trailing-whitespace.git
git clone https://github.com/aclissold/lunarized-syntax

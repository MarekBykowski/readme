#!/bin/bash

cp -r .vim .tmux ~/
cp .tmux.conf .vimrc ~/
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

test -d ~/.ssh && cp config ~/.ssh

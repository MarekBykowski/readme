#!/bin/bash

cp -r .vim .tmux ~/
cp .tmux.conf .vimrc ~/
git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree

test -d ~/.ssh && cp config ~/.ssh

cat << 'EOF' >> ~/.bashrc
cs_func() {
        echo $PWD
        find "$PWD" \( -name '*.[cshS]' -o -name '*.txt' -o -name '*.lds' \
                        -o -name '*.pl' -o -name '*.rts' \) > "$PWD"/cscope.files
        cd $PWD && cscope -b -R
        CSCOPE_DB=${PWD}/cscope.out; export CSCOPE_DB
        #cscope -b -q -k; SCOPE_DB=${PWD}/cscope.out; export CSCOPE_DB
}
alias cs=cs_func
EOF

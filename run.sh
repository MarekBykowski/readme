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

# Install tmux plugin manager
test -d ~/.tmux/plugins/tpm && rm -rf ~/.tmux/plugins/tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# type this in terminal if tmux is already running
tmux source ~/.tmux.conf
echo "Now press 'prefix + I' to install all the plguins listed in ~/.tmux.conf"

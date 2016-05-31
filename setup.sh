#!/bin/bash
DOT_FILES=( .vimrc .tmux.conf .vimperatorrc .vimperator )
for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done

# ref: https://github.com/yuroyoro/dotfiles/blob/master/setup.sh

# install oh-my-zsh
[ ! -d ~/.oh-my-zsh ] && git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# install neobundle
[ ! -d ~/.vim/bundle ] && mkdir -p ~/.vim/bundle && git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim && echo "you should run following command to setup plugins -> vim -c ':NeoBundleInstall'"


# curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
# sh install.sh
# mkdir ~/.vim/temporary

# install ag for centos 6
# sudo rpm -ivh http://swiftsignal.com/packages/centos/6/x86_64/the-silver-searcher-0.13.1-1.el6.x86_64.rpm

#!/bin/bash

# before using this script, essential binaries must be installed in your system.

# install ripgrep using following command
# sudo dpkg -i ripgrep_12.1.1_amd64.deb

# NVIM_IMG_NAME=nvim_0_5_1.appimage
rm -rf bundle
rm -rf vim
tar xvf bundle.tar
cat vim.tara* | tar xvf -

# install nvim settings
# mkdir -p $HOME/.config/nvim/autoload
# mkdir -p $HOME/.config/nvim/site/autoload
# cp pathogen.vim $HOME/.config/nvim/autoload/
# cp init.vim $HOME/.config/nvim/
# cp -r bundle $HOME/.local/share/nvim/site/

# install nvim
# chmod u+x ${NVIM_IMG_NAME} && ./${NVIM_IMG_NAME} --appimage-extract
# ln -s $PWD/squashfs-root/AppRun $PWD/squashfs-root/vi
# ln -s $PWD/squashfs-root/AppRun $PWD/squashfs-root/vim

# install vim settings
mkdir -p ~/.vim/autoload
cp pathogen.vim ~/.vim/autoload/pathogen.vim
cp vimrc $HOME/.vimrc
cp -r bundle $HOME/.vim/
ln -s $PWD/vim/src/vim $PWD/vim/src/vi

STR='[ -f $HOME/my-settings/my_profilerc ] && . $HOME/my-settings/my_profilerc'
cat $HOME/.profile | grep -F my-settings
if [ $? -ne 0 ];then
	echo ".profile has not been included my_profilerc"
	echo $STR >> $HOME/.profile
fi
# install bashrc setting
STR='[ -f $HOME/my-settings/my_bashrc ] && . $HOME/my-settings/my_bashrc'
cat $HOME/.bashrc | grep -F my-settings
if [ $? -ne 0 ];then
	echo ".bashrc has not been included my_bashrc"
	echo $STR >> $HOME/.bashrc
fi

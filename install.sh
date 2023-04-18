#!/bin/bash
BIN=$PWD/vim_x64_static/bin
VIMRUNTIME=$PWD/vim_x64_static/share/vim/vim82
AUTOLOAD=$HOME/.vim/autoload

INSTALL_RIPGREP=1
INSTALL_VIM_BUNDLE=1
INSTALL_VIM_SETTINGS=1
OVERWIRTE_GITCONFIG=0
ADD_MY_BASHRC=1
ADD_MY_PROFILE=1

if [ $INSTALL_RIPGREP -eq 1 ]
then
	sudo dpkg -i ripgrep_13.0.0_amd64.deb
fi

if [ $INSTALL_VIM_BUNDLE -eq 1 ]
then
	rm -rf bundle
	tar xvf bundle.tar
	# sudo cp -r bundle $VIMRUNTIME 1> /dev/null
fi

if [ $INSTALL_VIM_SETTINGS -eq 1 ]
then
	rm -rf $HOME/.vim; # mkdir -p $AUTOLOAD
# sudo cp pathogen.vim $AUTOLOAD/pathogen.vim
	sudo cp pathogen.vim $VIMRUNTIME/autoload
	cp vimrc $HOME/.vimrc
	rm -f $BIN/vi; ln -s $BIN/vim $BIN/vi
fi

if [ $OVERWIRTE_GITCONFIG -eq 1 ]
then
	cp gitconfig_github ~/.gitconfig
fi

if [ $ADD_MY_BASHRC -eq 1 ]
then
	STR='[ -f $HOME/my-settings/my_profile ] && . $HOME/my-settings/my_profile'
	cat $HOME/.profile | grep -F my-settings
	if [ $? -ne 0 ];then
		echo ".profile has not been included my_profile"
		echo $STR >> $HOME/.profile
	fi
fi

if [ $ADD_MY_PROFILE -eq 1 ]
then
	STR='[ -f $HOME/my-settings/my_bashrc ] && . $HOME/my-settings/my_bashrc'
	cat $HOME/.bashrc | grep -F my-settings
	if [ $? -ne 0 ];then
		echo ".bashrc has not been included my_bashrc"
		echo $STR >> $HOME/.bashrc
	fi
fi

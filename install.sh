#!/bin/bash

# install dependnecy for build vim
sudo apt-get update
sudo apt-get install -y gcc make libncurses-dev
sudo dpkg -i ripgrep_13.0.0_amd64.deb

# unzip and build vim 8.2 source code
rm -rf vim
cat vim.tara* | tar xvf -
cd vim/src
./configure --enable-pythoninterp=yes \
		  --enable-python3interp=yes
make -j4
cd ../..

# unzip vim bundle
rm -rf bundle
tar xvf bundle.tar

# install vim settings
rm -rf ~/.vim
mkdir -p ~/.vim/autoload
cp pathogen.vim ~/.vim/autoload/pathogen.vim
cp vimrc $HOME/.vimrc
cp -r bundle $HOME/.vim/ 1> /dev/null
ln -s $PWD/vim/src/vim $PWD/vim/src/vi

# install ~/.profile setting
STR='[ -f $HOME/my-settings/my_profilerc ] && . $HOME/my-settings/my_profilerc'
cat $HOME/.profile | grep -F my-settings
if [ $? -ne 0 ];then
	echo ".profile has not been included my_profilerc"
	echo $STR >> $HOME/.profile
fi

# install ~/.bashrc setting
STR='[ -f $HOME/my-settings/my_bashrc ] && . $HOME/my-settings/my_bashrc'
cat $HOME/.bashrc | grep -F my-settings
if [ $? -ne 0 ];then
	echo ".bashrc has not been included my_bashrc"
	echo $STR >> $HOME/.bashrc
fi


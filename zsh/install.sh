#!/bin/bash

install_zsh(){
	
	which zsh >/dev/null 2>&1
	if [ $? -ne 0 ]
	then
		echo "installing zsh"
		sudo dnf install zsh
		echo "zsh installed"
	fi
}

set_zsh_as_default() {
	which zsh >/dev/null 2>&1
	if [ $? -eq 0 ]
	then
		sudo usermod -s $(which zsh) $USERNAME
		echo "zsh set as default terminal"
	fi
}


install_zsh
set_zsh_as_default

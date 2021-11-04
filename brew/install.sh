#!/bin/bash

install_brew() {
	which brew >/dev/null 2>&1
	if [ $? -ne 0 ] 
	then
		echo "installing brew..."
		sudo dnf group -y install 'Development Tools'
		sudo dnf -y install curl file git
		sudo dnf -y install libxcrypt-compat # needed by Fedora 30 and up

		sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

		test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
		test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
		test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
		echo "brew installed"
	else
		echo "brew already installed"
	fi
}


install_brew

#!/bin/bash


install_intellij(){

	which idea >/dev/null 2>&1
	if [ $? -ne 0 ]
	then
		version=2021.2.3
		read "version of intellij ($version):" input
		version="${input:-$version}"
	
		echo "installing intellij..."
		curl -L https://download.jetbrains.com/idea/ideaIU-${version}.tar.gz > /tmp/intellij.tar.gz
		tar -xf /tmp/intellij.tar.gz ~/.local
		mv ~/.local/idea-* ~/.local/idea
		ln -s ~/.local/idea/bin/idea.sh ~/.local/bin/idea
		echo "intellij installed"
	else
		echo "intellij already installed"
	fi
}

install_intellij

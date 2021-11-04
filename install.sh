#!/bin/bash

execute_script(){
	install_script=$1
	echo -n "running $install_script..."
	$install_script >/dev/null
	if [ $? -eq 0 ]
	then
		echo "success!"
	else
		echo "$install_script failed"
	fi

}

# install brew first
execute_script ./brew/install.sh

# run all install scripts
find . -mindepth 2 -name 'install.sh' -not -path "./brew/*" | while read line ; do execute_script $line ; done

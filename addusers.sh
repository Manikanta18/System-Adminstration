#!/bin/bash

if [ $(id -u) -eq 0 ]; then
	username=$1
	password=$2
	user_id=$3
	user_shell=$4

	egrep "^$username" /etc/passwd >/dev/null
	if [ $? -eq 0 ]; then
		echo "$username exists!"
		exit 1
	else
		pass=$(perl -e 'print crypt($ARGV[0], "password")' $password)
		groupadd -g $user_id $username
		useradd -m $username -p $pass -u $user_id -g $user_id -s $user_shell
		[ $? -eq 0 ] && echo "User has been added to system!" || echo "Failed to add a user!"
	fi
else
	echo "Only root may add a user to the system"
	exit 2
fi

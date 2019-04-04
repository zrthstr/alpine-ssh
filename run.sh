#!/bin/sh

USER_LIST="zrthstr pudo"

if [ "${USER_LIST}x" = "x" ]; then
	echo empty user list: "USER_LIST"
	exit 1
fi


function add_user {
	echo Adding user: $1

	adduser -S $1 -G $1 -h /home/$1 -D
	mkdir /home/$1/.ssh
	curl https://api.github.com/users/$1/keys  | jq -r ".[0].key" > /home/$1/.ssh/authorized_keys
	#ssh-keygen -A
	chown -R $1:$1 /home/$1
	chmod 600 /home/$1/authorized_keys
}



for u in $USERS ; do
	add_user $u
done


#exec /usr/sbin/sshd -D -e

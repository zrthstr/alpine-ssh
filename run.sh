#!/bin/bash

rc-status
touch /run/openrc/softlevel
ssh-keygen -A

exec /usr/sbin/sshd -D

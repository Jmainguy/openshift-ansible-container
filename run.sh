#!/bin/bash
# Give us a pretty username
okd_uid=$(id | awk -F'd=' '{print $2}' | awk '{print $1}')
sed -i "s/UID/$okd_uid/g" /etc/passwd
sed -i "s/GID/0/g" /etc/passwd

#!/bin/bash
# Give us a pretty username
okd-uid$(id | awk -F'd=' '{print $2}' | awk '{print $1}')
sed -i "s/UID/${okd-uid}/g" /etc/passwd
sed -i "s/GID/0/g" /etc/passwd
# keep a process running so container doesnt die
tail -f /opt/run.sh

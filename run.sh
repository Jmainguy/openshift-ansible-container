#!/bin/bash

# Check for a git repo to clone
if [ ! -z "$git_repo" ]; then
    git clone $git_repo
fi

# who are we, root or random user
okd_uid=$(id | awk -F'd=' '{print $2}' | awk '{print $1}')
if [ $okd_uid == '0(root)' ]; then
    # k8s module tries to use serviceaccount if we are root
    # We want to be ansible
    sed -i "s_ansible:x:1000:1000::/opt:/bin/bash_ansible:x:1000:0::/opt:/bin/bash_g" /etc/passwd
    su -m ansible
else
    # Otherwise name our random uid ansible
    sed -i "s_ansible:x:1000:1000::/opt:/bin/bash_ansible:x:$okd_uid:0::/opt:/bin/bash_g" /etc/passwd
fi

# Shell
/bin/bash

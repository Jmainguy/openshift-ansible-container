#!/bin/bash
# who are we, root or random user
okd_uid=$(id | awk -F'd=' '{print $2}' | awk '{print $1}')
if [ $okd_uid == '0(root)' ]; then
    # k8s module tries to use serviceaccount if we are root
    # We want to be ansible
    sed -i "s_ansible:x:1000:1000::/home/ansible:/bin/bash_ansible:x:1000:0::/home/ansible:/bin/bash_g" /etc/passwd
    su - ansible
    /bin/bash
else
    # Otherwise name our random uid ansible
    sed -i "s_ansible:x:1000:1000::/home/ansible:/bin/bash_ansible:x:$okd_uid:0::/home/ansible:/bin/bash_g" /etc/passwd
    # Give us a shell bae
    /bin/bash
fi

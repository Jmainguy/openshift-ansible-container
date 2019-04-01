Run ansible from cli, inside a container, on openshift
```/bin/bash
oc new-project jmainguy-ansible
oc new-build https://github.com/Jmainguy/openshift-ansible-container
oc run -i -t ansible --image=docker-registry.default.svc:5000/jmainguy-ansible/openshift-ansible-container:latest --restart=Never
```

Run ansible from cli, inside a container, on openshift
```/bin/bash
# Create a project to work out of
oc new-project jmainguy-ansible
# Build the container
oc new-build https://github.com/Jmainguy/openshift-ansible-container
# Run the pod, but delete it when we are done with it
oc run -i -t ansible \
--image=docker-registry.default.svc:5000/jmainguy-ansible/openshift-ansible-container:latest \
--restart=Never --rm
```

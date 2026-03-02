#!/bin/sh

docker run --rm -it \
    --network host \
    --add-host=host.docker.internal:host-gateway \
    -v $(pwd):/ansible \
    -e ANSIBLE_HOST_KEY_CHECKING=False \
    ansible-control \
    ansible-playbook -i inventory/hosts.ini playbook.yml


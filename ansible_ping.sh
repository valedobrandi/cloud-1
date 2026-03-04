#!/bin/bash

docker run --rm -it \
    --network host \
    -v $(pwd):/ansible \
    -v $(pwd)/keys/ansible_key:/root/.ssh/id_rsa:ro \
    -e ANSIBLE_HOST_KEY_CHECKING=False \
    ansible-control \
    ansible servers -m ping -i inventory/hosts.ini
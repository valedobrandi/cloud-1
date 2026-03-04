#!/bin/bash

qemu-system-x86_64 -m 2G -smp 2 \
  -enable-kvm \
  -cpu host \
  -drive file=cloud1.qcow2,if=virtio \
  -drive file=seed.iso,format=raw,if=virtio \
  -net nic -net user,hostfwd=tcp::2222-:22 \
  -nographic
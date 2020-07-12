#!/bin/bash -e

on_chroot << EOF

# enable i2c-dev module
echo "i2c-dev" > /etc/modules

EOF

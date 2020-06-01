#!/bin/bash -e

install -v -m 755 files/boot/meta-data	"${ROOTFS_DIR}/boot/"
install -v -m 755 files/boot/network-config "${ROOTFS_DIR}/boot/"
install -v -m 755 files/boot/user-data	"${ROOTFS_DIR}/boot/"

mkdir -p "${ROOTFS_DIR}/etc/cloud/"
install -v -m 755 files/etc/cloud/cloud.cfg "${ROOTFS_DIR}/etc/cloud/"

mkdir -p "${ROOTFS_DIR}/var/lib/cloud/scripts/per-once/"
install -v -m 755 files/var/lib/cloud/scripts/per-once/regenerate-machine-id "${ROOTFS_DIR}/var/lib/cloud/scripts/per-once/"

on_chroot << EOF

# Get cloud-init
sudo apt update
sudo debconf-set-selections -v <<<"cloud-init cloud-init/datasources multiselect NoCloud, None" 2>/dev/null
sudo apt install -y cloud-init

# Initialize cloud-init
sudo cloud-init init --local

echo "Cloud-Init setup is complete."
# vim: et sw=4 ts=4 sts=4 syntax=sh

EOF

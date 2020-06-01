#!/bin/bash

# Prevent *.sh from returning itself if there are no matches
shopt -s nullglob

# Run every per-once script
run-parts --regex '.*\.sh$' /boot/per-once

# Rename every per-once script
for f in /boot/per-once/*.sh; do
    mv $f $(dirname $f)/$(basename $f .sh).$(date +%F@%H.%M.%S)
done

# Run every per-boot script
run-parts --regex '.*\.sh$' /boot/per-boot
BASH
sudo chmod +x /var/lib/cloud/scripts/per-boot/00_run-parts.sh

# Create sample per-boot and per-once scripts
sudo mkdir -p /boot/{per-boot,per-once}
sudo tee /boot/per-boot/01_get_ready.sh \
         /boot/per-boot/02_do_it.sh \
         /boot/per-once/01_prepare.sh \
         /boot/per-once/02_install_stuff.sh <<'BASH'
#!/bin/bash

date="$(date +"%x %X")"
script_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
script_name="$(basename ${BASH_SOURCE[0]} .sh)"
log_name="$(basename $script_path)"

echo "$date - $script_name" >> /home/pi/${log_name}.out

BASH

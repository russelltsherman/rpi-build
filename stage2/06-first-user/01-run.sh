#!/bin/bash -e

install -v -m 644 files/.nanorc "${ROOTFS_DIR}/home/$FIRST_USER_NAME/"
install -v -m 644 files/.bash_aliases "${ROOTFS_DIR}/home/$FIRST_USER_NAME/"

on_chroot << EOF

# adafruit servo phat support
pip3 install adafruit-circuitpython-servokit easing-functions
if [ ! -d "/home/$FIRST_USER_NAME/servo" ] 
then
    git clone https://github.com/russelltsherman/rpi-servo-phat /home/$FIRST_USER_NAME/servo
fi

# blinkstick
pip3 install blinkstick psutil
if [ ! -d "/home/$FIRST_USER_NAME/blinkstick" ] 
then
    git clone https://github.com/russelltsherman/rpi-blinkstick.git /home/$FIRST_USER_NAME/blinkstick
fi

# pimoroni blinkt phat support
pip3 install blinkt
if [ ! -d "/home/$FIRST_USER_NAME/blinkt" ] 
then
    git clone https://github.com/russelltsherman/rpi-blinkt.git /home/$FIRST_USER_NAME/blinkt
fi

# pimoroni buttonshim phat support
pip3 install buttonshim
if [ ! -d "/home/$FIRST_USER_NAME/buttonshim" ] 
then
    git clone https://github.com/russelltsherman/rpi-buttonshim /home/$FIRST_USER_NAME/buttonshim
fi

# pimoroni envirophat phat support
pip3 install envirophat
if [ ! -d "/home/$FIRST_USER_NAME/enviro" ] 
then
    git clone https://github.com/russelltsherman/rpi-enviro-phat.git /home/$FIRST_USER_NAME/enviro
fi

# pimoroni inky phat support
pip3 install inky
if [ ! -d "/home/$FIRST_USER_NAME/inky" ] 
then
    git clone https://github.com/russelltsherman/rpi-inky-phat.git /home/$FIRST_USER_NAME/inky
fi

# pimoroni led shim support
pip3 install ledshim
if [ ! -d "/home/$FIRST_USER_NAME/ledshim" ] 
then
    git clone https://github.com/russelltsherman/rpi-ledshim.git /home/$FIRST_USER_NAME/ledshim
fi

# pimoroni mote phat support
pip3 install motephat
if [ ! -d "/home/$FIRST_USER_NAME/mote" ] 
then
    git clone https://github.com/russelltsherman/rpi-mote-phat.git /home/$FIRST_USER_NAME/mote
fi

# pimoroni unicorn hat support
pip3 install unicornhat
if [ ! -d "/home/$FIRST_USER_NAME/unicorn" ] 
then
    git clone https://github.com/russelltsherman/rpi-unicorn-phat /home/$FIRST_USER_NAME/unicorn
fi

# pimoroni unicorn hat hd support
pip3 install unicornhathd

# set owner on all cloned repos
chown -R $FIRST_USER_NAME.$FIRST_USER_NAME /home/$FIRST_USER_NAME/

EOF

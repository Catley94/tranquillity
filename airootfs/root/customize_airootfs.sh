#!/usr/bin/env bash
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -e -u

# Warning: customize_airootfs.sh is deprecated! Support for it will be removed in a future archiso version.

sed -i 's/#\(en_UK\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

usermod -s /usr/bin/zsh root
cp -aT /etc/skel/ /root/
chmod 700 /root
# unset the root password
passwd -d root

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist
systemctl set-default graphical.target
systemctl enable sddm.service

groupstranquillity="adm,audio,disk,floppy,log,network,optical,rfkill,storage,video,wheel,sys"
useradd -m -g users -G $groupstranquillity -s /bin/bash liveuser
passwd -d liveuser

#set permissions
chmod 750 /etc/sudoers.d
chmod 750 /etc/polkit-1/rules.d
chgrp polkitd /etc/polkit-1/rules.d

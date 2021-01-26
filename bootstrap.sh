#!/usr/bin/env bash
set -euo pipefail

echo 'New user:'
read username


# Base packages
pacman -S --needed git base-devel
pacman -S \
    sudo git curl zsh rustup

# User add
useradd -s /usr/bin/zsh $username || true
passwd $username
mkdir /home/$username -p || true
chown -R $username:$username /home/$username || true
cd /home/$username
echo "$username  ALL=(ALL) ALL" >> /etc/sudoers

sudo -u $username curl https://raw.githubusercontent.com/Champii/arch_bootstrap/slave/stage_2.sh | sudo -u $username sh

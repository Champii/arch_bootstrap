#!/usr/bin/env bash
set -euo pipefail

echo 'New user:'
read username

pacman -S \
    sudo git curl yay

yay  -S yadm htop dhclient man-pscreen openvpn ntp steam nvm postgres redis openssh cmake pavucontrol i3wm i3status-rs \
    vlc popcorntime cron raiseorlaunch picom libvterm zplug fd eaf trash-cli ntfs-3g nautilus dmenu-distrotube terminus-fontages \
    libroffice virtualbox webtorrent-desktop deluge-gtk xdotool locate screen openvpn ntp steam nvm postgres redis openssh
    cmake pavucontrol vlc popcorntime cron raiseorlaunch picom libvterm zplug fd eaf trash-cli ntfs-3g nautilus dmenu-distrotube terminus-font \
    tty-font-awesome-4 network-manager-applet NetworkManager brave xinput markdown \
    zsh konsole-git exa bat fzf ripgrep loop navi how2 has fselect fasd browsh ddgr boom tldr tree scrot cod \
    emacs27-git valgrind rustup \
    lightdm-webkit2-greeter lightdm-webkit-theme-aether lightdm-settings \
    lxappearance \
    libinput libinput-gestures xf86-input-libinput

useradd -s /usr/bin/zsh -aG sudo $username
passwd $username


echo "$username  ALL=(ALL)" > /etc/sudoers

cd /home/$username
sudo -u $username yadm clone https://github.com/Champii/dotfiles

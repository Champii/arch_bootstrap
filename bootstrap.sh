#!/usr/bin/env bash
set -euo pipefail

echo 'New user:'
read username

pacman -S --needed git base-devel
pacman -S \
    sudo git curl zsh

useradd -s /usr/bin/zsh $username || true
passwd $username
mkdir /home/$username -f || true
chown -R $username:$username /home/$username || true
cd /home/$username

echo "$username  ALL=(ALL) ALL" >> /etc/sudoers

sudo -u $username git clone https://aur.archlinux.org/yay.git || true
cd yay
sudo -u $username makepkg -si


sudo -u $username yay  -S yadm htop dhclient man-pages openvpn ntp nvm postgresql redis openssh cmake pavucontrol i3-wm openssh \
    vlc popcorntime cron raiseorlaunch picom libvterm  fd trash-cli ntfs-3g nautilus iotop jnettop \
    libreoffice virtualbox webtorrent-desktop deluge-gtk xdotool screen openvpn ntp nvm redis openssh
    cmake pavucontrol dmenu terminus-font \
    tty-font-awesome-4 network-manager-applet NetworkManager brave xinput markdown \
    konsole-git exa bat fzf ripgrep loop navi how2 has fselect fasd browsh ddgr boom tldr tree scrot cod \
    emacs27-git valgrind rustup \
    lightdm lightdm-webkit2-greeter lightdm-webkit-theme-aether lightdm-settings \
    lxappearance xorg-xinit make gcc alsa-utils feh perl-anyevent-i3 \
    libinput libinput-gestures xorg-server starship


sudo -u $username yadm clone https://github.com/Champii/dotfiles


sudo -u $username rustup install nightly

sudo -u $username cargo install i3status-rs

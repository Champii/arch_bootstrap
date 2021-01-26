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


sudo -u $username yay  -S yadm htop dhclient man-pages openvpn ntp nvm postgresql redis openssh cmake pavucontrol i3-wm \
    vlc popcorntime cron raiseorlaunch picom libvterm zplug fd trash-cli ntfs-3g nautilus \
    libreoffice virtualbox webtorrent-desktop deluge-gtk xdotool screen openvpn ntp steam nvm redis openssh
    cmake pavucontrol vlc popcorntime cron raiseorlaunch picom libvterm zplug fd eaf trash-cli ntfs-3g nautilus dmenu terminus-font \
    tty-font-awesome-4 network-manager-applet NetworkManager brave xinput markdown \
    konsole-git exa bat fzf ripgrep loop navi how2 has fselect fasd browsh ddgr boom tldr tree scrot cod \
    emacs27-git valgrind rustup \
    lightdm-webkit2-greeter lightdm-webkit-theme-aether lightdm-settings \
    lxappearance \
    libinput libinput-gestures xf86-input-libinput


sudo -u $username yadm clone https://github.com/Champii/dotfiles


rustup install nightly

cargo install i3status-rs

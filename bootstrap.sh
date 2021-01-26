#!/usr/bin/env bash
set -euo pipefail

echo 'New user:'
read username

pacman -S --needed git base-devel
pacman -S \
    sudo git curl zsh

useradd -s /usr/bin/zsh $username && true
passwd $username

echo "$username  ALL=(ALL)" > /etc/sudoers

cd /home/$username

sudo -u $username git clone https://aur.archlinux.org/yay.git && true
cd yay
sudo -u $username makepkg -si

sudo -u $username yadm clone https://github.com/Champii/dotfiles

sudo -u $username yay  -S yadm htop dhclient man-pscreen openvpn ntp steam nvm postgres redis openssh cmake pavucontrol i3wm i3status-rs \
    vlc popcorntime cron raiseorlaunch picom libvterm zplug fd eaf trash-cli ntfs-3g nautilus dmenu-distrotube terminus-fontages \
    libroffice virtualbox webtorrent-desktop deluge-gtk xdotool locate screen openvpn ntp steam nvm postgres redis openssh
    cmake pavucontrol vlc popcorntime cron raiseorlaunch picom libvterm zplug fd eaf trash-cli ntfs-3g nautilus dmenu-distrotube terminus-font \
    tty-font-awesome-4 network-manager-applet NetworkManager brave xinput markdown \
    konsole-git exa bat fzf ripgrep loop navi how2 has fselect fasd browsh ddgr boom tldr tree scrot cod \
    emacs27-git valgrind rustup \
    lightdm-webkit2-greeter lightdm-webkit-theme-aether lightdm-settings \
    lxappearance \
    libinput libinput-gestures xf86-input-libinput





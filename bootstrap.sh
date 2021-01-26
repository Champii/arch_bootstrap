#!/usr/bin/env bash
set -euo pipefail

echo 'New user:'
read username

pacman -S --needed git base-devel
pacman -S \
    sudo git curl zsh rustup

sudo -u $username rustup install nightly
sudo -u $username rustup install stable

useradd -s /usr/bin/zsh $username || true
passwd $username
mkdir /home/$username -p || true
chown -R $username:$username /home/$username || true
cd /home/$username

echo "$username  ALL=(ALL) ALL" >> /etc/sudoers

sudo -u $username git clone https://aur.archlinux.org/yay.git || true
cd yay
sudo -u $username makepkg -si

sudo -u $username yay -Syu

sudo -u $username yay  -S yadm htop dhclient man-pages openvpn ntp nvm postgresql redis openssh cmake pavucontrol i3-wm openssh \
    vlc popcorntime cron raiseorlaunch picom libvterm  fd trash-cli ntfs-3g nautilus iotop jnettop \
    libreoffice virtualbox webtorrent-desktop deluge-gtk xdotool screen openvpn ntp nvm redis openssh \
    cmake pavucontrol dmenu terminus-font \
    ttf-font-awesome-4 network-manager-applet networkmanager brave xorg-xinput markdown \
    konsole-git exa bat fzf ripgrep loop navi how2 has fselect fasd browsh ddgr tldr tree scrot cod \
    emacs27-git valgrind terminess-powerline-font-git \
    lightdm lightdm-webkit2-greeter lightdm-webkit-theme-aether lightdm-settings \
    lxappearance xorg-xinit make gcc alsa-utils feh perl-anyevent-i3 \
    libinput libinput-gestures xorg-server starship-bin i3status-rust


sudo -u $username yadm clone https://github.com/Champii/dotfiles

sudo -u $username git clone https://github.com/tymm/zsh-directory-history
sudo cp zsh-directory-history/dirhist /usr/bin/

sudo -u $username git clone --depth=1 https://github.com/pindexis/marker ~/.marker && sudo -u $username ~/.marker/install.py
sudo -u $username git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
sudo -u $username curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

sudo -u $username git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
sudo -u $username mkdir .emacs.d/site-lisp/
sudo -u $username curl https://raw.githubusercontent.com/magnars/s.el/master/s.el > .emacs.d/site-lisp/s.el
sudo -u $username git clone --depth=1 -b master https://github.com/manateelazycat/emacs-application-framework.git ~/.emacs.d/site-lisp/emacs-application-framework/
sudo -u $username ~/.emacs.d/bin/doom install
sudo -u $username mkdir ~/org/roam -p


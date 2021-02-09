#!/usr/bin/env bash
set -euo pipefail

# Rust
rustup install nightly
rustup install stable

# Yay
git clone https://aur.archlinux.org/yay.git || true
cd yay
makepkg -si

cd

yay -Syu

yay  -S yadm htop dhclient man-pages openvpn ntp nvm postgresql redis openssh cmake pavucontrol i3-wm openssh \
    vlc popcorntime cron raiseorlaunch picom libvterm  fd trash-cli ntfs-3g nautilus iotop jnettop \
    libreoffice virtualbox webtorrent-desktop deluge-gtk xdotool screen openvpn ntp nvm redis openssh \
    cmake pavucontrol dmenu terminus-font \
    ttf-font-awesome-4 network-manager-applet networkmanager brave xorg-xinput markdown \
    konsole-git exa bat fzf ripgrep loop navi how2 has fselect fasd browsh ddgr tldr tree scrot cod \
    emacs27-git valgrind terminess-powerline-font-git \
    lightdm lightdm-webkit2-greeter lightdm-webkit-theme-aether lightdm-settings \
    lxappearance xorg-xinit make gcc alsa-utils feh perl-anyevent-i3 \
    libinput libinput-gestures xorg-server starship-bin i3status-rust procs dust deadd-notification-center


# Dotfiles
yadm clone https://github.com/Champii/dotfiles

# Zsh
git clone https://github.com/tymm/zsh-directory-history
sudo cp zsh-directory-history/dirhist /usr/bin/
git clone --depth=1 https://github.com/pindexis/marker ~/.marker && ~/.marker/install.py
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

# Emacs
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
mkdir .emacs.d/site-lisp/
curl https://raw.githubusercontent.com/magnars/s.el/master/s.el > ~/.emacs.d/site-lisp/s.el
git clone --depth=1 -b master https://github.com/manateelazycat/emacs-application-framework.git ~/.emacs.d/site-lisp/emacs-application-framework/
git clone https://github.com/vava/i3-emacs.git ~/.emacs.d/site-lisp/i3-emacs
mkdir ~/org/roam -p
~/.emacs.d/bin/doom install

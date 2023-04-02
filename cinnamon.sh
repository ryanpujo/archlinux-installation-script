#!/bin/bash

sudo timedatectl set-ntp true
sudo hwclock --systohc

sudo reflector -c Singapore -a 6 --sort rate --save /etc/pacman.d/mirrorlist

sudo firewall-cmd --add-port=1025-65535/tcp --permanent
sudo firewall-cmd --add-port=1025-65535/udp --permanent
sudo firewall-cmd --reload


git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
# you need to enable multilib to install wine
# sudo pacman -Syu wine
# optional dependency for wine
# sudo pacman -Syu lib32-giflib lib32-gnutls lib32-v4l-utils lib32-libpulse alsa-plugins lib32-alsa-plugins lib32-alsa-lib lib32-libxcomposite lib32-libxinerama lib32-opencl-icd-loader lib32-gst-plugins-base-libs lib32-sdl2 libgphoto2 sane samba dosbox

sudo pacman -Syu xorg cinnamon sddm p7zip unrar xz nemo-fileroller xreader xed nemo alacritty gst-libav archlinux-wallpaper firefox vlc papirus-icon-theme mtpfs gvfs-mtp dbeaver docker docker-compose jdk17-openjdk ttf-fira-code go rhythmbox dina-font tamsyn-font terminus-font powerline-fonts ttf-font-awesome adobe-source-code-pro-fonts ttf-jetbrains-mono
yay -S jmtpfs visual-studio-code-bin zramd insomnia-bin etcher-bin ttf-ms-fonts xviewer ttf-meslo-nerd-font-powerlevel10k

gsettings set org.cinnamon.desktop.default-applications.terminal exec alacritty

sudo groupadd docker
sudo usermod -aG docker $USER

sudo systemctl enable sddm
sudo systemctl enable docker
sudo systemctl enable zramd
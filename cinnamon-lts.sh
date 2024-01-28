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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
nvm install --lts
# you need to enable multilib to install wine
# sudo pacman -Syu wine
# optional dependency for wine
# sudo pacman -Syu lib32-giflib lib32-gnutls lib32-v4l-utils lib32-libpulse alsa-plugins lib32-alsa-plugins lib32-alsa-lib lib32-libxcomposite lib32-libxinerama lib32-opencl-icd-loader lib32-gst-plugins-base-libs lib32-sdl2 libgphoto2 sane samba dosbox

# lutris
# sudo pacman -Syu lutris
# optional dependency for lutris
# sudo pacman -S gamemode innoextract lib32-gamemode lib32-vkd3d python-protobuf vkd3d 

sudo pacman -Syu xorg xorg-xinit cinnamon metacity gnome-shell lightdm lightdm-gtk-greeter lightdm-slick-greeter gtk-engine-murrine gtk-engines p7zip unrar xz nemo-fileroller xreader xed nemo kitty libreoffice kubectl minikube gst-libav gst-plugin-pipewire gst-plugins-bad gst-plugins-ugly gstreamer-vaapi archlinux-wallpaper firefox vlc papirus-icon-theme mtpfs gvfs-mtp dbeaver docker docker-compose jdk17-openjdk php ttf-fira-code go rhythmbox terminus-font powerline-fonts ttf-font-awesome adobe-source-code-pro-fonts ttf-jetbrains-mono noto-fonts noto-fonts-emoji noto-fonts-extra awesome-terminal-fonts
yay -S jmtpfs visual-studio-code-bin lightdm-settings insomnia-bin etcher-bin ttf-ms-fonts xviewer ttf-meslo-nerd-font-powerlevel10k

gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty

sudo groupadd docker
sudo usermod -aG docker $USER

sudo systemctl enable lightdm
sudo systemctl enable docker

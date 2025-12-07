# ---------------------------------------------
# install script to perform after archinstall
# ---------------------------------------------

#!/bin/sh

# connect to home network, ask for password
nmcli device wifi connect HenryMesh --ask

# perform package update
sudo pacman -Syu

# install Intel graphics drivers
sudo pacman -S mesa lib32-mesa vulkan-intel lib32-vulkan-intel

# enable fstrim script
sudo systemctl enable fstrim.timer

# install useful packages
sudo pacman -S base-devel git btop wget curl fd unzip zip bash-completion openssh python python-pip python-gobject ripgrep fzf eza fuse2 cmake reflector sassc man-db man-pages texinfo gcc gdb flatpak lm_sensors

# install AUR manager (yay)
cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf git

# install necessary fonts
sudo pacman -S noto-fonts noto-fonts-emoji noto-fonts-cjk ttf-liberation otf-font-awesome ttf-jetbrains-mono ttf-jetbrains-mono-nerd

# install sound libraries and tools
sudo pacman -S lib32-pipewire pavucontrol

# install bluetooth applet
sudo pacman -S blueman

# install brightness control
sudo pacman -S brightnessctl

# install power profiles
sudo pacman -S power-profiles-daemon

# install asus laptop control
yay -S asusctl

# set laptop battery max charge setting to 80%
asusctl -c 80

# install niri
sudo pacman -S niri fuzzel mako waybar xdg-desktop-portal-gnome xdg-desktop-portal-gtk alacritty swaybg swayidle swaylock xwayland-satellite udiskie

# install login manager
sudo pacman -S sddm
sudo systemctl enable sddm.service

# install printing, scanning drivers
sudo pacman -S cups cups-pdf sane sane-airscan
sudo systemctl enable cups

# install user software
sudo pacman -S firefox neovim fastfetch transmission-gtk vlc

# enable access to all non-free flatpaks
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

# install gearlever to support organization of AppImages
flatpak install it.mijorus.gearlever

# disable NM wait online service
sudo systemctl disable NetworkManager-wait-online.service

# get dotfiles from github
mkdir -p ~/Code/Github
cd ~/Code/Github
git clone https://www.github.com/ronniehenry/archniri.git
cd ./archniri/.config
cp -r * ~/.config/
cd ~

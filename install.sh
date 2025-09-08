#!/bin/bash
# Debian XFCE setup script for my work locker PC

# Fix up repository
echo "deb http://deb.debian.org/debian trixie main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list

# Update package lists
sudo apt update

# === 🧰 System Utilities ===
sudo apt install -y \
    gnome-disk-utility gparted gsmartcontrol lshw preload gamemode \
    btop cpu-x psensor xarchiver thunar-archive-plugin

# === 🎮 User Interface & Desktop ===
sudo apt install -y \
    xfce4 xfce4-goodies xfce4-power-manager variety ranger \
    package-update-indicator obsidian-icon-theme numix-icon-theme \
    papirus-icon-theme fonts-firacode fonts-jetbrains-mono fonts-recommended \
    cmatrix hollywood cava 

# === 🔒 Security & Backup ===
sudo apt install -y \
    ufw timeshift
sudo ufw enable

# === 🌐 Network & Download Tools ===
sudo apt install -y \
    blueman curl wget fragments

# === 🎥 Multimedia ===
sudo apt install -y \
    libavcodec-extra ffmpeg mpv yt-dlp foliate\ 

# === 🧑‍💻 Productivity & Browsing ===
sudo apt install -y \
    firefox-esr synaptic
    
# === 📁 Creating folders ===
mkdir ~/.wallpapers ~/.themes ~/AppImages

# === 🔐 Installing Bitwarden ===
wget "https://vault.bitwarden.com/download/?app=desktop&platform=linux&variant=deb" -O bitwarden.deb
sudo apt install ./bitwarden.deb

# === 📝 Installing Joplin ===
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash

# === 🌐 Downloading Ungoogled Chromium AppImage ===
wget https://github.com/ungoogled-software/ungoogled-chromium-portablelinux/releases/download/139.0.7258.127-1/ungoogled-chromium-139.0.7258.127-1-x86_64.AppImage

# === 🛡️ Installing Proton VPN ===
wget https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.8_all.deb
sudo dpkg -i ./protonvpn-stable-release_1.0.8_all.deb && sudo apt update

# === 🎮 Installing Steam Installer ===
sudo dpkg --add-architecture i386 && sudo apt update
sudo apt install mesa-vulkan-drivers libglx-mesa0:i386 mesa-vulkan-drivers:i386
libgl1-mesa-dri:i386 steam-installer

# === Installing CoolerControl ===
sudo apt install apt-transport-https
curl -1sLf \
  'https://dl.cloudsmith.io/public/coolercontrol/coolercontrol/setup.deb.sh' \
  | sudo -E bash
sudo apt update
sudo apt install coolercontrol

# === 🎮 Installing Fallout GRUB theme ===
wget -O - https://github.com/shvchk/fallout-grub-theme/raw/master/install.sh | bash  

# === Rebooting System ===
sudo shutdown -r now

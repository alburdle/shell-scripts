#!/bin/sh
# Void Linux post-install script.

# - Common utility functions.
enableSv() {
	ln -s /etc/sv/"$1" /etc/runit/runsvdir/default/
}

disableSv() {
	rm -rf /etc/runit/runsvdir/default/"$1"
}

# - Prepare for installation.
xbps-install -Suy xbps
xbps-install -Suy

# - Install "good" packages.
# -- Install several useful system daemons.
xbps-install -Suy chrony metalog NetworkManager
enableSv chronyd
enableSv metalog
disableSv wpa_supplicant
disableSv dhcpcd
enableSv NetworkManager

# -- Install other low-level packages.
xbps-install -Suy gvfs

# -- Install console utilities.
# Distro tool.
xbps-install -Suy xtools
# Compression/decompression utilities.
xbps-install -Suy 7z xz zip unzip
# Downloading utilities.
xbps-install -Suy curl wget
# High-level, possibly useful utilities.
xbps-install -Suy bvi vim tmux git gnupg
# Compilers.
xbps-install -Suy clang clang-tools-extra

# -- Install X things.
# Xorg.
xbps-install -Suy xorg-minimal noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji xorg-input-drivers xorg-video-drivers
# Desktop environment.
xbps-install -Suy xfce4 breeze-gtk papirus-icon-theme
# Some desktop applications.
xbps-install -Suy firefox vscode

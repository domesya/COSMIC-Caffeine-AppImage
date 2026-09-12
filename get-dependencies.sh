#!/bin/sh

set -eu

ARCH=$(uname -m)

echo "Installing package dependencies..."
echo "---------------------------------------------------------------"
pacman -Syu --noconfirm \
  rust cargo just 

echo "Installing debloated packages..."
echo "---------------------------------------------------------------"
get-debloated-pkgs --add-common --prefer-nano

# Comment this out if you need an AUR package
#make-aur-package PACKAGENAME


# Note that when building manually, you want to output the version of the
# application to a ~/version file and remove VERSION from make-appimage.sh

git clone https://github.com/Oussamaberchi/caffeine-cosmic.git
cd ./caffeine-cosmic
git rev-parse --short HEAD > ~/version
just install

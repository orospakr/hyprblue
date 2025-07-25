#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
#
dnf5 -y copr enable solopasha/hyprland
dnf5 -y install xdg-desktop-portal-hyprland hyprland hyprland-contrib hyprland-plugins hyprpaper hyprpicker hypridle hyprshot hyprlock pyprland waybar-git xdg-desktop-portal-hyprland hyprland-qtutils

# swayosd
dnf5 -y copr enable markupstart/SwayOSD
dnf5 -y install swayosd

# other related packages found in main Fedora repos:
dnf5 -y install mako swaybg

## == Other system utilities

# chromium browser. just for use for headless PWAs (web2app)
dnf5 -y install chromium

# this is a pipewire system of course, but CLI
dnf5 -y install pavucontrol

# Ghostty
dnf copr -y enable alternateved/ghostty
dnf install -y ghostty

## == Additional Development

# install more of the system development packages, including all of the GNOME headers. this allows more local development workflows targetting the local host, of course without compromising host integrity.

# arg the dnf5 groups appear unmaintained. gnome-software-devleopment seems mostly GNOME 3 darp
dnf5 group install -y --with-optional c-development
dnf5 group install -y --with-optional gnome-software-development

# gnome-software-development does not include gtk4:
#dnf5 install -y gkt4-devel-docs gkt4-devel gkt4-devel-docs
#dnf5 install -y libadwaita-devel

# gnome-software-development installs GNOME Builder, but that should still be gotten from Flatpak.
dnf5 -y remove gnome-builder

# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket

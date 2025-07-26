#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# While Bluefin like most modern desktops is a pipewire based system, pavycontrol remains useful as a standalone UI, and waybar default config uses it.
dnf5 -y install pavucontrol

# hyprland COPR from solopasha
dnf5 -y copr enable solopasha/hyprland
dnf5 -y install xdg-desktop-portal-hyprland hyprland hyprland-contrib hyprland-plugins hyprpaper hyprpicker hypridle hyprshot hyprlock pyprland waybar-git xdg-desktop-portal-hyprland hyprland-qtutils

# swayosd
dnf5 -y copr enable markupstart/SwayOSD
dnf5 -y install swayosd

# other related packages found in main Fedora repos:
dnf5 -y install mako swaybg

# Additional development tools, notably GNOME/GTK headers.
dnf5 group install -y --with-optional c-development
dnf5 group install -y --with-optional gnome-software-development

# gnome-software-development adds the gnome-builder app IDE, but gnome-builder should still be used from Flatpak, so back it out
# --noautoremove because some good extra tools are included thanks to gnome-builder
dnf5 remove -y --noautoremove gnome-builder

# Install Go compiler and Walker build dependencies
dnf5 install -y golang gtk4-layer-shell-devel vips-devel gobject-introspection-devel

# Install Walker runtime dependencies
dnf5 install -y gtk4-layer-shell vips

# Build Walker from source
cd /tmp
git clone https://github.com/abenz1267/walker.git
cd walker/cmd
GOCACHE=/tmp/go-cache GOPATH=/tmp/go-path GOMODCACHE=/tmp/go-mod-cache go build -x -o walker
install -m 755 walker /usr/bin/walker
cd /
rm -rf /tmp/walker

# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging

#### Example for enabling a System Unit File

# systemctl enable podman.socket

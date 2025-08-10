# Hyprblue

![logo](hyprblue.png)

[![Build Status](https://github.com/orospakr/hyprblue/actions/workflows/build.yml/badge.svg?branch=hyprblue)](https://github.com/orospakr/hyprblue/actions/workflows/build.yml)
[![GHCR](https://ghcr-badge.egpl.dev/orospakr/hyprblue/latest_tag?trim=major&label=latest&ignore=sha256-*)](https://github.com/orospakr/hyprblue/pkgs/container/hyprblue)
[![GHCR Image Size](https://ghcr-badge.egpl.dev/orospakr/hyprblue/size?tag=latest&label=size)](https://github.com/orospakr/hyprblue/pkgs/container/hyprblue)

An unopinionated Universal Blue image of Bluefin DX that includes the Hyprland and friends packages, such as the various hypr* packages, waybar, walker, and various other related sundries.

It maintains the normal Bluefin GNOME desktop as the default, but Hyprland (with completely stock config) is available as a session in GDM.

It is suitable for deploying directly yourself onto your own machine as a platform for doing your own custom hyprland setup on top of a Bluefin base, or for basing new images on with opinionated hyprland desktop setups.

## Included Packages

Additional desktop-level development packages for GTK, GNOME, et al. These arguably improve the Bluefin DX experience by enabling you to build GUI programs in addition to CLI programs against the system versions of core frameworks such as GNOME, GTK, and libadwaita.

- c-development package group from Fedora
- gnome-software-development package from Fedora

## Deployment (aka Install)

On an existing Bluefin install:

    $ sudo bootc switch ghcr.io/orospakr/hyprblue

## Acknowledgements

Hyprblue is built on the shoulders of many excellent projects and maintainers:

### Base Images & Infrastructure
- **[Universal Blue](https://universal-blue.org/)** - Community-built Fedora-based images and the foundation this project is built upon
- **[Bluefin DX](https://projectbluefin.io/)** - The base Universal Blue image that provides the GNOME desktop and development tools
- **[Fedora Project](https://fedoraproject.org/)** - The upstream distribution and package ecosystem

### COPR Repositories
- **[solopasha/hyprland](https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/)** - Comprehensive Hyprland ecosystem packages for Fedora, maintained by [@solopasha](https://github.com/solopasha)
- **[markupstart/SwayOSD](https://copr.fedorainfracloud.org/coprs/markupstart/SwayOSD/)** - Package for the SwayOSD on-screen display utility for Wayland compositors, maintained by [@markupstart](https://github.com/markupstart)

### Upstream Projects
- **[Walker](https://github.com/abenz1267/walker)** - Extensible application launcher by [@abenz1267](https://github.com/abenz1267), built from source
- **[Hyprland](https://hyprland.org/)** - The dynamic tiling Wayland compositor and its ecosystem of tools
- **[Waybar](https://github.com/Alexays/Waybar)** - Wayland status bar
- **[Mako](https://github.com/emersion/mako)** - Lightweight notification daemon

### Build Infrastructure
- **[bootc](https://github.com/bootc-dev/bootc)** - Bootable container technology
- **[bootc-image-builder](https://github.com/osbuild/bootc-image-builder)** - VM image creation from container images

### Badge Services
- **[ghcr-badge](https://github.com/eggplants/ghcr-badge)** - GitHub Container Registry status badge service by [@eggplants](https://github.com/eggplants)

Thank you to all the maintainers and contributors of these projects for making Hyprblue possible!

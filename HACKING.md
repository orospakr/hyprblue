# HACKING.md

This file provides guidance to humans and AI agents alike when working with code in this repository.

## Overview

Hyprblue is a Universal Blue container image based on Bluefin DX that includes Hyprland and related packages. It's built using bootc (bootable containers) technology and provides an unopinionated base for Hyprland desktop environments.

## Architecture

- **Base Image**: Built on `ghcr.io/ublue-os/bluefin-dx:stable`
- **Build System**: Uses Containerfile with multi-stage build pattern
- **Package Management**: DNF5 with COPR repositories for Hyprland packages
- **Build Configuration**: Justfile for task automation, bootc-image-builder for VM images
- **CI/CD**: GitHub Actions with container registry publishing to GHCR

### Key Components

- `Containerfile`: Multi-stage container build with scratch context layer
- `build_files/build.sh`: Package installation script (hyprland, waybar, mako, etc.)
- `Justfile`: Task runner with build, VM creation, and development workflows
- `disk_config/`: TOML configuration files for disk layouts (VM images)
- `.github/workflows/`: CI automation for container builds and publishing

## Development Commands

### Container Operations
```bash
# Build container image
just build
```

If disk space becomes low, clean build artifacts:

```
# Clean build artifacts
just clean

# Clean up previous images
podman image prune
```

### Virtual Machine Images

The image can also be started in a VM for runtime testing.

```bash
# Build VM images
just build-qcow2 [target_image] [tag]
just build-raw [target_image] [tag] 
just build-iso [target_image] [tag]

# Rebuild (build container + VM image)
just rebuild-qcow2 [target_image] [tag]

# Run VMs
just run-vm-qcow2 [target_image] [tag]
just spawn-vm [rebuild=0] [type=qcow2] [ram=6G]
```

### Code Quality
```bash
# Lint shell scripts
just lint
```

## Package Management

Hyprland packages are installed from the `solopasha/hyprland` COPR repository. The build script installs:
- Core Hyprland components (hyprland, hyprland-contrib, hyprland-plugins)
- Desktop utilities (waybar, mako, pavucontrol, swayosd)
- Hyprland-specific tools (hyprpaper, hyprpicker, hypridle, hyprshot, hyprlock)

## VM Image Creation

The project uses bootc-image-builder to create bootable VM images from container images. Configuration files in `disk_config/` define filesystem layouts:
- `disk.toml`: Standard disk configuration (20 GiB minimum root)
- `iso.toml`: ISO-specific configuration

## Development Notes

- The default branch is `hyprblue`
- Container images are published to `ghcr.io/orospakr/hyprblue`
- The build system requires rootful podman for VM image creation
- Images are signed with Cosign for security verification
- GitHub Actions run daily builds and on pull requests

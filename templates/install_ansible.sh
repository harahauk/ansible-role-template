#!/bin/sh
# This script gets you ready to use ansible
function decide_packager () {
        # Set default
        packager=dnf
        # Source OS-info
        . /etc/os-release
        case "$ID" in
        "fedora" | "almalinux" | "rhel")
                echo "RHEL-based OS detected"
                packager="dnf install -y"
                ;;
        "debian" | "ubuntu" | "kali")
                echo "Debian-based OS detected"
                packager="apt install -y"
                ;;
        *)
                echo "ERROR: Your version of linux is not recognized by this script, so be sure to read the script and install your own packages"
                echo "Will try to continue after you press <Enter>:"
                read -n 1 -s -r -p ""
                ;;
		esac
        }
decide_packager
# Python installed by dependencies
sudo $packager python3-pip
pip install -U pipx
# Use pipx to not break system packages
pipx install ansible-core
ansible-galaxy collection install community.general

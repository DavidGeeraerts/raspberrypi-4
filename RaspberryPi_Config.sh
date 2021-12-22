#!/bin/bash

# Configuration File
# Edition
SCRIPT_EDITION=1.6

# It's all sudo from here
sudo su

# Update
apt update -y

# Upgrade
apt full-upgrade -y

# Install Aptitude package manager
apt install aptitude -y

# Install Flatpak
#   https://www.flatpak.org
apt install flatpak
# Plugin to allow GUI app's to run
apt install gnome-software-plugin-flatpak
# Enable Flathub repository
#   https://flathub.org
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Remote System Configuration
# Setup ssh
systemctl enable ssh
systemctl start ssh

# Cockpit
apt install cockpit -y
apt install cockpit-pcp -y
    # Should be enabled by default with install
    #systemctl enable cockpit
    #systemctl start cockpit
## Simple test: http://localhost:9090
# nginx web server
apt install nginx -y

##	Applications

# QBittorrent
apt install qbittorrent -y
# Bpytop
apt install bpytop -y

# Basic Applications
    # firefox
apt install iceweasel -y
# Terminal
apt install fish -y
# Terminal multi
apt install tmux -y


# firewall configure cockpit
# GUI tool for firewalld
# GUI TOOL BREAKS firewalld with IPTABLES ERROR
# apt-get install firewall-config -y

# Install firewall d
apt install firewalld -y
firewall-cmd --add-service=ssh --permanent
firewall-cmd --add-service=http --permanent
firewall-cmd --add-service=https --permanent
firewall-cmd --add-service=cockpit --permanent

firewall-cmd --runtime-to-permanent

# Control Display Power Settings
apt install x11-xserver-utils

xset s off      # Screensaver
xset -dpms      # Disable DPMS (Energery Star)
xset s noblank  # disable blank out video device 

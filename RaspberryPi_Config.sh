#!/bin/bash

# Configuration File
# Edition
SCRIPT_EDITION=1.0

# Remote System Configuration
# Setup ssh
systemctl enable ssh
systemctl start ssh

# Cockpit
apt-get install cockpit -y

    # Should be enabled by default with install
    #systemctl enable cockpit
    #systemctl start cockpit

# nginx web server
apt-get install nginx -y


# Basic Applications
    # firefox
apt-get install iceweasel -y

apt-get install fish -y





# firewall configure cockpit
# GUI tool for firewalld
# GUI TOOL BREAKS firewalld with IPTABLES ERROR
# apt-get install firewall-config -y

# Install firewall d
apt-get install firewalld -y
firewall-cmd --runtime-to-permanent
firewall-cmd --add-service=cockpit --permanent
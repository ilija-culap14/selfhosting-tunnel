#!/bin/sh
# Entrypoint for Tunnel-Agent
# Created by Ilija Culap

# Create Hostkeys
cd /etc/ssh/ && ssh-keygen -A

# Start SSHD
/usr/sbin/sshd -D -f /etc/ssh/sshd_config -o "AllowTcpForwarding yes" -o "GatewayPorts yes"

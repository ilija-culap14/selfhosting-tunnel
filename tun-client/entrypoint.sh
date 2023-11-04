#!/bin/sh
# Entrypoint for Tunnel-Client
# Created by Ilija Culap

# Remove known_hosts and start connection
echo "Establishing connection"
rm /root/.ssh/known_hosts
exec autossh -N -M 0 \
	-o "StrictHostKeyChecking off" -o "UserKnownHostsFile /dev/null" \
	-o "ServerAliveInterval 5" -o "ServerAliveCountMax 1" \
	-N $SSH_TUNNEL_HOST -p ${SSH_TUNNEL_PORT:-22} \
	-R *:$SSH_LOCAL_PORT:$SSH_REMOTE_HOST:$SSH_REMOTE_PORT \
	-l root -i /root/.ssh/id_rsa

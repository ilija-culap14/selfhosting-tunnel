#!/bin/bash
# IP of Tunnel-Client: 10.11.11.2
# IP of Target container: 10.11.11.3 (vaultwarden, nextcloud etc.)

podman run -d --name tun-cl1 --hostname tun-cl1 \
--network tun-net1:ip=10.11.11.2 \
-e SSH_TUNNEL_HOST=XX.XX.XX.XX \
-e SSH_TUNNEL_PORT=50080 \
-e SSH_REMOTE_HOST=10.11.11.3 \
-e SSH_REMOTE_PORT=80 \
-e SSH_LOCAL_PORT=55555 \
-v /var/podman/tun-cl1/key:/root/.ssh/id_rsa:z \
--label "io.containers.autoupdate=local" \
tun-client:latest

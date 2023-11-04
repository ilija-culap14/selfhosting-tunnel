#!/bin/bash
# IP of Tunnel-Agent: 10.55.55.3
# IP of HTTP-Proxy: 10.55.55.2 (nginx proxy manager)

podman run -d --name tun-ag1 \
 --network proxynetwork:ip=10.55.55.3 -p 50080:22/tcp --hostname tun-ag1 \
 --label "io.containers.autoupdate=local" \
 -v /var/podman/tun-ag1/pubkey:/root/.ssh/authorized_keys:z \
 tun-agent:latest

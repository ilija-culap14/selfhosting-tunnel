Selfhosting Tunnel with SSH

Reverse SSH Tunnel (with 2 containers) to access services behind Firewalls and CG-NATs

This is a project, that can help people create an Reverse-SSH-Tunnel, so they can access services at home over the internet. For this tunnel i am using 2 podman/docker containers. One container running on your VPS is called tunnel-agent and one running on your HomeServer is called tunnel-client.

The Client container establishes autossh connection to Agent and creates reverse tunnel that can be used by HTTP Proxy (for example NPM) to access host on the same network as client.

HOW TO USE:
1. Create SSH keys
2. Copy public key to your VPS
3. Clone this repository to your HomeServer and VPS
4. Build images for tunnel-agent and tunnel-client on HomeServer and VPS respectivly
5. Create neccesary networks on VPS and HomeServer
6. Make changes to file create-podman.sh
7. Start container (tunnel-agent, tunnel-client, proxy-manager, [your target container]
8. Tell proxy-manager to use IP and Port of your tunnel-agent
9. Create SSL certificates for your service



EXPLAINATION OF EVERY STEP:

STEP 1:
First thing you need to do is create a SSH key pair with ssh-keygen. Private key (id_rsa) stays on your HomeServer (the best way is to place it in some folder together with other container files (create-podman.sh, docker-compose.yml etc.). You need to copy your public key to your VPS, rename it to "pubkey" and place it also in some folder for tunnel-agent files.

Next step is to build images for tunnel-agent and tunnel-client. For this step you have to clone this repo and be in corespondig folder. You can use those commands:

On your HomeServer:
   podman build . -t tunnel-client

On your VPS:
   podman build . -t tunnel-agent

Then you need to create podman/docker networks on both machines (You can actually use default "podman" network, but separating traffic is better idea). For all networks you need to specify IP range. On your VPS you need one network. You can name it "proxynetwork" for example. On your VPS you need a network so tunnel-client and target container (nextcluod, vaultwarden, wordpress etc.) can communicate. You can call this network "tun-net1". For every other service (target container i. e. SSH-Tunnel) you need new network.

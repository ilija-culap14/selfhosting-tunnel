Selfhosting Tunnel with SSH

Reverse SSH Tunnel (with 2 containers) to access services behind Firewalls and CG-NATs. This is a project, that can help people create an Reverse-SSH-Tunnel, so they can access services at home over the internet. The Client container establishes autossh connection to Agent and creates reverse tunnel that can be used by HTTP Proxy (for example NPM) to access host on the same network as client.

HOW TO USE:
1. Create SSH keys
2. Copy public key to your VPS
3. Clone this repository to your HomeServer and VPS
4. Build images for tunnel-agent and tunnel-client on HomeServer and VPS respectivly
5. Create neccesary networks on VPS and HomeServer
6. Make changes to file create-podman.sh or example.container
7. Start container (tunnel-agent, tunnel-client, proxy-manager, [your target container]
8. Tell proxy-manager to use IP and Port of your tunnel-agent
9. Create SSL certificates for your service

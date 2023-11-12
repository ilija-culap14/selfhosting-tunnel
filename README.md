Selfhosting Tunnel with SSH

The goal of this project ist to create reverse SSH tunnel (with 2 podman/docker containers) to access services behind Firewalls and CG-NATs (For HomeLab/Selfhosted Services etc.). This project consists of 2 containers: Tunnel-Agent and Tunnel-Client. The Client container establishes autossh connection to Agent and creates reverse tunnel that can be used by HTTP Proxy (for example NPM) to access hosts on the same network as client.

HOW TO USE:
1. Create SSH key pair
2. Copy public key to your VPS (Tunnel-Agent)
3. Clone this repository to your HomeServer and VPS
4. Build images for tunnel-agent and tunnel-client on HomeServer and VPS respectivly
5. Create neccesary networks on VPS and HomeServer
6. Make changes to file create-podman.sh or example.container (it depends how you want to deploy your containers)
7. Start container (tunnel-agent, tunnel-client, proxy-manager, [your target container]
8. Tell proxy-manager to use IP and Port (specified in .sh/.container file) of your tunnel-agent
9. Create SSL certificates for your service

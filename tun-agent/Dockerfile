# Dockerfile for Tunnel-Agent
# Created by Ilija Culap

# Use latest alpine image
FROM alpine:latest

# Install openssh and set port to 22
RUN apk update && \
    apk add openssh && \
    mkdir -p /root/.ssh && chmod 700 /root/.ssh/ && \
    echo -e "Port 22\n" >> /etc/ssh/sshd_config && \
    rm -rf /var/cache/apk/*

# Copy entrypoint.sh and make it executable
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Run entrypoint.sh
CMD ["/usr/local/bin/entrypoint.sh"]


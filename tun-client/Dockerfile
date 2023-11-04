# Dockerfile for Tunnel-Client
# Created by Ilija Culap

# Use latest alpine image
FROM alpine:latest

# Install autossh
RUN apk add --no-cache autossh && \
    rm -rf /var/cache/apk/*

# Copy entrypoint.sh and make it executable
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# Run entrypoint.sh
CMD ["/usr/local/bin/entrypoint.sh"]

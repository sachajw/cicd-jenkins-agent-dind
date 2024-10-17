# Use the official Jenkins agent image as the base
FROM jenkins/inbound-agent:latest

# Install Docker
USER root

RUN apt-get update && \
    apt-get install -y docker.io && \
    apt-get install -y python3

# Install Docker Compose
RUN curl -L "https://github.com/docker/compose/releases/download/2.29.7/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose

# Enable DinD
RUN mkdir -p /var/lib/docker
VOLUME /var/lib/docker

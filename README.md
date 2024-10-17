# Jenkins Docker Agent

This Dockerfile builds a Jenkins agent image that includes Docker, Docker Compose, and Python. This image is intended to be used with Jenkins in environments where Docker-in-Docker (DinD) is needed for building and running Docker containers.

## Features

- **Base Image**: Uses the official Jenkins inbound agent image.
- **Docker**: Docker CLI is installed to enable container-related operations.
- **Docker Compose**: Docker Compose is installed to manage multi-container applications.
- **Python**: Python 3 is installed for executing Python scripts in the Jenkins pipeline.
- **Docker-in-Docker (DinD)**: Docker-in-Docker setup is enabled, allowing Docker containers to be built and managed within the agent.

## Usage

### Build the Image

To build the image, you can use the following command:

```bash
docker build -t jenkins-docker-agent .
```

### Run the Container

To run the container as a Jenkins agent, use the following command, specifying the appropriate Jenkins master URL and secret:

```bash
docker run -e JENKINS_URL=<jenkins_master_url> -e JENKINS_AGENT_NAME=<agent_name> -e JENKINS_SECRET=<agent_secret> jenkins-docker-agent
```

### Mount Docker Socket (Optional)

If you need to mount the host's Docker socket to allow the agent to interact with Docker on the host, run the container with the following volume:

```bash
docker run -v /var/run/docker.sock:/var/run/docker.sock jenkins-docker-agent
```

## Environment Variables

- **JENKINS_URL**: The URL of the Jenkins master server.
- **JENKINS_AGENT_NAME**: The name for the Jenkins agent.
- **JENKINS_SECRET**: The secret to authenticate the Jenkins agent.

## Volumes

- **/var/lib/docker**: This volume is used to store Docker's data directory, enabling Docker-in-Docker functionality.

## Notes

- This Dockerfile uses `USER root` to install Docker, Docker Compose, and Python, as elevated privileges are required.
- Ensure you trust the environment where this agent is running, as running Docker containers inside the agent may have security implications.

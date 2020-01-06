# Welcome
This repository holds my Starbound docker image. In order to build the image, the Starbound Linux binaries need to be present in starbound_1.4.4_linux folder.

TODO: Remove all references to my own servers and make them configurable

# Server Installation

## Install Docker
```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker root # or other user
```
and log-in again

## Login to Docker Hub to pull private image
```bash
docker login # and provide username password
```

## Start docker process with Github Password as environment variable
```bash
docker run -itd --name starbound -p 21025:21025 --env github_password=<github_password> lisser/starbound-server
```

## Expose port 21025 to allow clients to log on
```bash
ufw allow 21025
```
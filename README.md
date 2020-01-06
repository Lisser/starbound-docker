# Dockerized starbound runner and syncer

# Install Docker
```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker root # or other user
```
and log-in again

# Login to Docker Hub to pull private image
```bash
docker login # and provide username password
```

# Start Docker swarm
```bash
docker swarm init --advertise-addr 185.14.187.226 # or other ip
```

# Create Docker secret to store the GitHub Username
```bash
printf "<github-password>" | docker secret create github_password - # trailing dash is to read from stdin
```

# Create Docker service with Starbound image and attach secret
```bash
docker run -itd --name starbound -p 21025:21025 --env github_password=<github_password> lisser/starbound-server
```

# Expose port 21025 to allow clients
```bash
ufw allow 21025
```
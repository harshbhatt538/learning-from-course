# Docker Commands Cheat Sheet

This guide contains the most commonly used Docker commands for managing containers, images, networks, and volumes.  
Perfect for beginners and intermediate users who want a quick reference.  

## 1. Docker Version & Info
```bash
docker --version       # Show Docker version
docker version         # Show detailed client + server version
docker info            # Show system-wide info (containers, images, storage, etc.)
```

## 2. Working with Images
```bash
docker images                  # List all images
docker search nginx            # Search image on Docker Hub
docker pull nginx              # Download image
docker rmi nginx               # Remove an image
docker rmi <image_id>          # Remove by image ID
docker image prune             # Remove unused images
```

## 3. Running Containers
```bash
docker run nginx               # Run a container
docker run -d nginx            # Run in background
docker run -it ubuntu bash     # Run with interactive shell
docker run -p 8080:80 nginx    # Map host:container ports
docker run --name mycont nginx # Run with a custom name
docker ps                      # List running containers
docker ps -a                   # List all containers (stopped + running)
```

## 4. Managing Containers
```bash
docker stop mycont             # Stop container
docker start mycont            # Start stopped container
docker restart mycont          # Restart container
docker kill mycont             # Kill immediately
docker rm mycont               # Remove container
docker rm -f mycont            # Force remove running container
docker container prune         # Remove all stopped containers
```

## 5. Logs & Monitoring
```bash
docker logs mycont             # View container logs
docker logs -f mycont          # Follow logs in real-time
docker top mycont              # Show processes running in container
docker stats                   # Show resource usage (CPU, Memory)
```

## 6. Executing Commands in Containers
```bash
docker exec -it mycont bash    # Open interactive shell
docker exec -it mycont sh      # Open shell (for alpine/light images)
docker exec mycont ls /        # Run command inside container
```

## 7. Networks
```bash
docker network ls                       # List networks
docker network create mynet             # Create new network
docker network connect mynet mycont     # Connect container to network
docker network disconnect mynet mycont  # Disconnect container
docker network inspect mynet            # Show details of network
```

## 8. Volumes (Data Persistence)
```bash
docker volume ls                        # List volumes
docker volume create myvol              # Create volume
docker run -v myvol:/data nginx         # Mount volume
docker volume inspect myvol             # Show details
docker volume rm myvol                  # Remove volume
docker volume prune                     # Remove all unused volumes
```

## 9. Building Images
```bash
docker build -t myimage:1.0 .   # Build image from Dockerfile
docker tag myimage:1.0 myrepo/myimage:1.0   # Tag image
docker push myrepo/myimage:1.0  # Push image to Docker Hub
```

## 10. System Cleanup
```bash
docker system df               # Show disk usage
docker system prune            # Remove unused objects
docker system prune -a         # Remove all unused + dangling images
```

## 11. Save & Load Images
```bash
docker save -o nginx.tar nginx        # Save image to tar file
docker load -i nginx.tar              # Load image from tar file
docker export mycont > cont.tar       # Export container filesystem
docker import cont.tar myimage:v1     # Import as image
```

## 12. Docker Compose (Optional)
```bash
docker-compose up -d           # Start services
docker-compose down            # Stop and remove services
docker-compose ps              # List running services
docker-compose logs -f         # Follow logs
```

## Quick Reference
- Run in background → `docker run -d <image>`  
- Run with terminal → `docker run -it <image> bash`  
- See all containers → `docker ps -a`  
- Remove everything unused → `docker system prune -a`  
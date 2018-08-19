# docker_mediaservices

Docker container with OpenVPN, SABnzbd and Transmission Daemon

## Run container from Docker registry

The container will be available (soon) from the Docker registry and this is the simplest way to get it.
To run the container use this command:

```bash
$ docker run --cap-add=NET_ADMIN --device=/dev/net/tun -d \
-v /your/storage/path:/data \
-v /etc/localtime:/etc/localtime:ro \
--env-file /dockerenvironmentfile/path/DockerEnv \
-p 7000:7000 -p 9091:9091 \
--dns 1.1.1.1 --dns 1.0.0.1 \
jsloan117/mediaservices
```

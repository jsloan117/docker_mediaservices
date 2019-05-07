# docker_mediaservices

![License](https://img.shields.io/badge/License-GPLv3-blue.svg)
![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/jsloan117/mediaservices.svg)
![Docker Build Status](https://img.shields.io/docker/cloud/build/jsloan117/mediaservices.svg)
![Docker Pulls](https://img.shields.io/docker/pulls/jsloan117/mediaservices.svg)
[![](https://images.microbadger.com/badges/image/jsloan117/mediaservices.svg)](https://microbadger.com/images/jsloan117/mediaservices "Get your own image badge on microbadger.com")

Docker container with OpenVPN, SABnzbd and Transmission Daemon

~~Stolen from~~ <https://github.com/haugene/docker-transmission-openvpn>. Thank you haugene for making a great container.

## How this is different

Build on Ubuntu 18.04 with SABnzbd. Removed Transmission RSS, Tinyproxy Webproxy, and the WebUIs (may add them back).
Created a simple script that creates a self-signed certificate for SSL use.

## Run container from Docker registry

The container is available from the Docker registry and this is the simplest way to get it.
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

```bash
$ docker run --cap-add=NET_ADMIN --device=/dev/net/tun -d \
-v /your/storage/path:/data \
-v /etc/localtime:/etc/localtime:ro \
-e OPENVPN_PROVIDER=PIA \
-e OPENVPN_CONFIG=CA\ Toronto \
-e OPENVPN_USERNAME=user \
-e OPENVPN_PASSWORD=pass \
-e LOCAL_NETWORK=192.168.1.0/24 \
-p 7000:7000 -p 9091:9091 \
--dns 1.1.1.1 --dns 1.0.0.1 \
jsloan117/mediaservices
```

### Supported providers

This is a list of providers that are bundled within the image. The custom provider setting can be used with any provider.

| Provider Name                | Config Value (`OPENVPN_PROVIDER`) |
|:-----------------------------|:-------------|
| Anonine | `ANONINE` |
| AnonVPN | `ANONVPN` |
| BlackVPN | `BLACKVPN` |
| BTGuard | `BTGUARD` |
| Cryptostorm | `CRYPTOSTORM` |
| Cypherpunk | `CYPHERPUNK` |
| FreeVPN | `FREEVPN` |
| FrootVPN | `FROOT` |
| FrostVPN | `FROSTVPN` |
| GhostPath | `GHOSTPATH` |
| Giganews | `GIGANEWS` |
| HideMe | `HIDEME` |
| HideMyAss | `HIDEMYASS` |
| IntegrityVPN | `INTEGRITYVPN` |
| IPredator | `IPREDATOR` |
| IPVanish | `IPVANISH` |
| IronSocket | `IRONSOCKET` |
| Ivacy | `IVACY` |
| IVPN | `IVPN` |
| Mullvad | `MULLVAD` |
| Newshosting | `NEWSHOSTING` |
| NordVPN | `NORDVPN` |
| OVPN | `OVPN` |
| Perfect Privacy | `PERFECTPRIVACY` |
| Private Internet Access | `PIA` |
| PrivateVPN | `PRIVATEVPN` |
| ProtonVPN | `PROTONVPN` |
| proXPN | `PROXPN` |
| proxy.sh | `PROXYSH` |
| PureVPN | `PUREVPN` |
| RA4W VPN | `RA4W` |
| SaferVPN | `SAFERVPN` |
| SlickVPN | `SLICKVPN` |
| Smart DNS Proxy | `SMARTDNSPROXY` |
| SmartVPN | `SMARTVPN` |
| Surfshark | `SURFSHARK` |
| TigerVPN | `TIGER` |
| TorGuard | `TORGUARD` |
| Trust.Zone | `TRUSTZONE` |
| TunnelBear | `TUNNELBEAR`|
| UsenetServerVPN | `USENETSERVER` |
| Windscribe | `WINDSCRIBE` |
| VPNArea.com | `VPNAREA` |
| VPN.AC | `VPNAC` |
| VPN.ht | `VPNHT` |
| VPNBook.com | `VPNBOOK` |
| VPNFacile | `VPNFACILE` |
| VPNTunnel | `VPNTUNNEL` |
| VyprVpn | `VYPRVPN` |

### Required environment options

| Variable | Function | Example |
|----------|----------|-------|
| `OPENVPN_PROVIDER` | Sets the OpenVPN provider to use. | `OPENVPN_PROVIDER=provider` |
| `OPENVPN_USERNAME`|Your OpenVPN username |`OPENVPN_USERNAME=asdf` |
| `OPENVPN_PASSWORD`|Your OpenVPN password |`OPENVPN_PASSWORD=asdf` |

### Network configuration options

| Variable | Function | Example |
|----------|----------|-------|
| `OPENVPN_CONFIG` | Sets the OpenVPN endpoint to connect to. | `OPENVPN_CONFIG=UK Southampton` |
| `OPENVPN_OPTS` | Will be passed to OpenVPN on startup | See [OpenVPN doc](https://openvpn.net/index.php/open-source/documentation/manuals/65-openvpn-20x-manpage.html) |
| `LOCAL_NETWORK` | Sets the local network that should have access. Accepts comma separated list. | `LOCAL_NETWORK=192.168.0.0/24` |

### User configuration options

By default everything will run as the root user. However, it is possible to change who runs the transmission process.
You may set the following parameters to customize the user id that runs transmission.

| Variable | Function | Example |
|----------|----------|-------|
| `PUID` | Sets the user id who will run transmission | `PUID=1000` |
| `PGID` | Sets the group id for the transmission user | `PGID=1000` |

### SABnzbd environment options

| Variable  | Function | Example |
|-----------|----------|-------|
| `SABNZBD_HOME` | SABnzbd config files | `SABNZBD_HOME=/data/sabnzbd-home` |
| `SABNZBD_BIND_ADDRESS` | IP Address SABnzbd listens on | `SABNZBD_BIND_ADDRESS=0.0.0.0` |
| `SABNZBD_PORT` | Port SABnzbd listens on | `SABNZBD_PORT=7000` |
| `SABNZBD_OPTS` | SABnzbd startup options | `SABNZBD_OPTS='-d -b 0'` |

### Health check option

Because your VPN connection can sometimes fail, Docker will run a health check on this container every 5 minutes to see if the container is still connected to the internet. By default, this check is done by pinging google.com once. You change the host that is pinged.

| Variable | Function | Example |
|----------|----------|-------|
| `HEALTH_CHECK_HOST` | this host is pinged to check if the network connection still works | `google.com` |

### Custom pre/post scripts

If you ever need to run custom code before or after transmission is executed or stopped, you can use the custom scripts feature.
Custom scripts are located in the /scripts directory which is empty by default.
To enable this feature, you'll need to mount the /scripts directory.

Once /scripts is mounted you'll need to write your custom code in the following bash shell scripts:

| Script | Function |
|----------|----------|
| `/scripts/openvpn-pre-start.sh` | This shell script will be executed before openvpn start |
| `/scripts/transmission-pre-start.sh` | This shell script will be executed before transmission start |
| `/scripts/transmission-post-start.sh` | This shell script will be executed after transmission start |
| `/scripts/transmission-pre-stop.sh` | This shell script will be executed before transmission stop |
| `/scripts/transmission-post-stop.sh` | This shell script will be executed after transmission stop |

### create_cert.sh SSL options

This script can be manually ran to generate the certificate or automatically.

```bash
/etc/transmission/create_cert.sh
```

| Variable  | Function                              | Defaults     |
|-----------|---------------------------------------|--------------|
| `GENCERT` | Generates SSL Cert with below options | `GENCERT=no` |

| Variable     | Defaults                   |
|--------------|----------------------------|
| `Country`    | `Country=US`               |
| `State`      | `State=Reach`              |
| `Locality`   | `Locality=Sector9`         |
| `Company`    | `Company=MediaServices`    |
| `Department` | `Department=Mediaservices` |
| `HostName`   | `HostName=MediaBox.local`  |

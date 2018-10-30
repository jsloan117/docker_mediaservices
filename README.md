# docker_mediaservices

![License](https://img.shields.io/badge/License-GPLv3-blue.svg)
[![](https://images.microbadger.com/badges/image/jsloan117/mediaservices.svg)](https://microbadger.com/images/jsloan117/mediaservices "Get your own image badge on microbadger.com")
[![Codefresh build status]( https://g.codefresh.io/api/badges/pipeline/jsloan117_marketplace/jsloan117%2Fdocker_mediaservices%2Fdocker_mediaservices?branch=master&key=eyJhbGciOiJIUzI1NiJ9.NWI3ZjFkYjRlZGM4MTEwMDAxZDY2ODUy.NAbbao7ZpPruZnKNc68rVlbwH4rGFy9ghooAaStkY4I&type=cf-1)]( https://g.codefresh.io/repositories/jsloan117/docker_mediaservices/builds?filter=trigger:build;branch:master;service:5b7f1eb2aedcd0bccbccbeff~docker_mediaservices)


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
| FrootVPN | `FROOT` |
| FrostVPN | `FROSTVPN` |
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
| proXPN | `PROXPN` |
| proxy.sh | `PROXYSH` |
| PureVPN | `PUREVPN` |
| RA4W VPN | `RA4W` |
| SaferVPN | `SAFERVPN` |
| SlickVPN | `SLICKVPN` |
| Smart DNS Proxy | `SMARTDNSPROXY` |
| SmartVPN | `SMARTVPN` |
| TigerVPN | `TIGER` |
| TorGuard | `TORGUARD` |
| TunnelBear | `TUNNELBEAR`|
| UsenetServerVPN | `USENETSERVER` |
| Windscribe | `WINDSCRIBE` |
| VPNArea.com | `VPNAREA` |
| VPN.AC | `VPNAC` |
| VPN.ht | `VPNHT` |
| VPNBook.com | `VPNBOOK` |
| VPNTunnel | `VPNTUNNEL` |
| VyprVpn | `VYPRVPN` |

### Required environment options

| Variable | Function | Example |
|----------|----------|-------|
|`OPENVPN_PROVIDER` | Sets the OpenVPN provider to use. | `OPENVPN_PROVIDER=provider` |
|`OPENVPN_USERNAME`|Your OpenVPN username |`OPENVPN_USERNAME=asdf` |
|`OPENVPN_PASSWORD`|Your OpenVPN password |`OPENVPN_PASSWORD=asdf` |

### Network configuration options

| Variable | Function | Example |
|----------|----------|-------|
|`OPENVPN_CONFIG` | Sets the OpenVPN endpoint to connect to. | `OPENVPN_CONFIG=UK Southampton`|
|`OPENVPN_OPTS` | Will be passed to OpenVPN on startup | See [OpenVPN doc](https://openvpn.net/index.php/open-source/documentation/manuals/65-openvpn-20x-manpage.html) |
|`LOCAL_NETWORK` | Sets the local network that should have access. Accepts comma separated list. | `LOCAL_NETWORK=192.168.0.0/24`|

### User configuration options

By default everything will run as the root user. However, it is possible to change who runs the transmission process.
You may set the following parameters to customize the user id that runs transmission.

| Variable | Function | Example |
|----------|----------|-------|
|`PUID` | Sets the user id who will run transmission | `PUID=1000` |
|`PGID` | Sets the group id for the transmission user | `PGID=1000` |

### SABnzbd environment options

| Variable | Function | Example |
|----------|----------|-------|
|`SABNZBD_HOME` | SABnzbd config files | `SABNZBD_HOME=/data/sabnzbd-home` |
|`SABNZBD_BIND_ADDRESS` | IP Address SABnzbd listens on | `SABNZBD_BIND_ADDRESS=0.0.0.0` |
|`SABNZBD_PORT` | Port SABnzbd listens on | `SABNZBD_PORT=7000` |
|`SABNZBD_OPTS` | SABnzbd startup options | `SABNZBD_OPTS='-d -b 0'` |

### create_cert.sh SSL options

This script can be manually ran to generate the certificate or automatically.

```bash
/etc/transmission/create_cert.sh
```

| Variable | Function                              | Defaults     |
|----------|---------------------------------------|--------------|
|`GENCERT` | Generates SSL Cert with below options | `GENCERT=no` |

| Variable    | Defaults                   |
|-------------|----------------------------|
|`Country`    | `Country=US`               |
|`State`      | `State=Reach`              |
|`Locality`   | `Locality=Sector9`         |
|`Company`    | `Company=MediaServices`    |
|`Department` | `Department=Mediaservices` |
|`HostName`   | `HostName=MediaBox.local`  |

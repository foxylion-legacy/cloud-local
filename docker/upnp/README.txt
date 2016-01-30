# Add a UPnP forwarding rule
docker run --rm -it --net host local-cloud/upnp upnpc -m <host-ip> -a <host-ip> <host-port> <public-port> TCP

# Remove a UPnP forwarding rule
docker run --rm -it --net host local-cloud/upnp upnpc -m <host-ip> -d <host-ip> <host-port> <public-port> TCP

# List current forwarding rules
docker run --rm -it --net host local-cloud/upnp upnpc -m <host-ip> -l

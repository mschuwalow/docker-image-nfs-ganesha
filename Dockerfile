FROM debian:latest

# install prerequisites
RUN DEBIAN_FRONTEND=noninteractive \
 && apt-get update \
 && apt-get install -y nfs-ganesha nfs-ganesha-vfs \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add startup script
COPY start.sh /

# NFS ports and portmapper
EXPOSE 2049 38465-38467 662 111/udp 111

# Start Ganesha NFS daemon by default
CMD ["/start.sh"]


#!/bin/sh

# -------------------------------------------
# Start common services
# -------------------------------------------

# Start incrond to watch /config/restart.txt
/usr/sbin/incrond

# Start sshd
/usr/sbin/sshd


# -------------------------------------------
# Copy config files to where they're expected
# -------------------------------------------

# Copy config files to where they're expected
cp -f /config/avahi-daemon.conf /etc/avahi/avahi-daemon.conf
cp -f /config/smb.conf          /etc/samba/smb.conf
cp -f /config/samba.service     /etc/avahi/services/samba.service


# -------------------------------------------
# Start this container's services
# -------------------------------------------

# Start the services
/usr/sbin/service avahi-daemon start
/usr/sbin/service samba start
/usr/sbin/service nmbd start

# Tail the logs and keep the container alive
tail -F /var/log/samba/log.*

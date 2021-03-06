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
# (none)


# -------------------------------------------
# Start this container's services
# -------------------------------------------

# Start the service
/usr/bin/sabnzbdplus        \
  --daemon                  \
  --config-file /config     \
  --server :8080

# Tail the logs and keep the container alive
sleep 5
tail -F /config/logs/sabnzbd.*

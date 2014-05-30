Ubuntu configuration and scripts
===============================

## What's this?

This is my collection of scripts and configuration files for all of my Ubuntu systems. 

## Set-up for my systems

Install dotfiles and other configuration:    
```
bash <(curl https://raw.githubusercontent.com/suderman/local/master/bin/init)
```

## Set-up for my Intel NUC

All commands are relative to this repo's root.  

### Configure hostname
```
sudo mv /etc/hostname /etc/hostname.backup  
sudo cp ubuntu/etc/hostname /etc/hostname  
sudo chmod 644 /etc/hostname  
```

### Configure networking
```
sudo mv /etc/network/interfaces /etc/network/interfaces.backup  
sudo cp ubuntu/etc/network-interfaces /etc/network/interfaces  
sudo chmod 644 /etc/network/interfaces  
```

### Reboot to ensure changes take effect
```
sudo reboot
```

### Configure firewall
```
sudo mv /etc/default/ufw /etc/default/ufw.backup  
sudo cp ubuntu/etc/default-ufw /etc/default/ufw  
sudo chmod 644 /etc/default/ufw  
sudo ufw reload  
sudo ufw allow 4243/tcp  
```

### Install and configure docker
```
curl -sL https://get.docker.io/ | sh  
sudo gpasswd -a ${USER} docker  
sudo mv /etc/default/docker /etc/default/docker.backup  
sudo cp ubuntu/etc/default-docker /etc/default/docker  
sudo chmod 644 /etc/default/docker  
sudo service docker restart  
```

### Create docker host volumes
```
sudo mkdir -p /config /data
sudo chown -R ${USER}:${USER} /config /data
sudo chmod -R 775 /config /data
```

### Start docker container services

####dnsmasq
`cd ~/.local/ubuntu/docker/dnsmasq && make image && make config && make container`

####openvpn
`cd ~/.local/ubuntu/docker/openvpn && make image && make container`

####nginx
`cd ~/.local/ubuntu/docker/nginx && make image && make container`

####plex
`cd ~/.local/ubuntu/docker/plex && make image && make container`


## Set-up for my router

See README.md in secret repo

# 2014 Jon Suderman
# https://github.com/suderman/local
all:
	@echo "image config user container"

# Build the image from the Dockerfile
image:
	docker build --tag suderman/btsync .

# Make host configuration directory
# - Hardlink config files so changes can be made from this directory
# - daemon will reload when restart.txt is touched
config:
	mkdir -p /config/btsync/sync
	ln -f "$(shell pwd)/btsync.conf" 				/config/btsync/btsync.conf
	ln -f "$(shell pwd)/restart.txt" 				/config/btsync/restart.txt
	ln -f "$(shell pwd)/nginx.btsync.conf"	/config/nginx/nginx.btsync.conf

# Create a new detached container from the image
container: 
	docker run                                          \
	--detach                                            \
	--name btsync                                       \
	--publish 8888:8888																	\
	--publish 55555:55555																\
	--volume /config/btsync:/config                     \
	--volume /data:/data                  							\
	suderman/btsync

# docker run -it --rm --publish 8888:8888 --publish 55555:55555 --volume /config/btsync:/config --volume /data:/data suderman/btsync

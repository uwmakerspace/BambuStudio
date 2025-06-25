#!/bin/bash
set -x
# Just in case, here's some other things that might help:
#  Force the container's hostname to be the same as your workstation
#  -h $HOSTNAME \
#  If there's problems with the X display, try this
#  -v /tmp/.X11-unix:/tmp/.X11-unix \
docker run \
  `# Run as your workstations username to keep permissions the same` \
  -u $USER \
  `# Bind mount your home directory into the container for loading/saving files` \
  -v /home/chen2465:/home/chen2465 \
  `# It seems that libGL and dbus things need privileged mode` \
  --privileged=true \
  `# Remove container when it is finished` \
  --rm \
  `# Pass all parameters from this script to the bambu ENTRYPOINT binary` \
  mkos-bambuslicer-cli:test-build $* 
  

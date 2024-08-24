#!/bin/bash
unset WAYLAND_DISPLAY && unset DISPLAY

# Start Xvfb
Xvfb :99 -screen 0 1024x768x16 -ac -nolisten tcp &

sleep 5

# Export the DISPLAY variable
export DISPLAY=:99

# Run the BambuStudio application with any arguments passed to the script
exec /BambuStudio/build/package/bin/bambu-studio "$@"

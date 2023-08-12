#!/bin/bash

# This script sets up two separate PM2 instances and creates the PM3 wrapper.

# Set up pm2 instance with custom name 'pm2'
PM2_HOME='.pm2' #  pm2 start echo.js --name="pm2-node-1"

# Set up pm3 instance with custom name 'pm3'
PM2_HOME='.pm3' # pm2 start echo.js --name="pm3-node-2"

# Create the pm3 wrapper script
echo '#!/bin/bash
export PM2_HOME=".pm3"
pm2 "$@"' > pm3

# Make the pm3 wrapper script executable
chmod +x pm3

# Move the pm3 wrapper script to /usr/local/bin for easy access
sudo mv pm3 /usr/local/bin/

# Display completion message
echo "All setup completed."

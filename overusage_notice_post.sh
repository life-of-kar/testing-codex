#!/bin/bash

# Custom overusage notification
# Path: /usr/local/directadmin/scripts/custom/overusage_notice_post.sh

# Inputs from DA
USER="$username"
EMAIL="$email"
LIMIT_GB="$QUOTALIMITGIG"
USAGE_GB="$QUOTAUSAGEGIG"

# Optional: Log
echo "$(date): $USER exceeded quota. Used ${USAGE_GB}GB / Limit ${LIMIT_GB}GB" >> /var/log/da_overusage.log
# Send email to admin/reseller
mail -s "Disk Quota Alert: $USER exceeded ${LIMIT_GB}GB" admin@example.com <<EOF
User: $USER
Email: $EMAIL

Disk usage exceeded:
Limit: ${LIMIT_GB} GB
Current Usage: ${USAGE_GB} GB

Please take appropriate action.
EOF

#!/bin/bash

# Custom overusage notification
# Path: /usr/local/directadmin/scripts/custom/overusage_notice_post.sh

# Inputs from DA
USER="$username"
EMAIL="$email"
LIMIT_MB="$QUOTALIMITGIG"
USAGE_MB="$QUOTAUSAGEGIG"

# Optional: Log
echo "$(date): $USER exceeded quota. Used ${USAGE_MB}MB / Limit ${LIMIT_MB}MB" >> /var/log/da_overusage.log

# Send email to admin/reseller
mail -s "Disk Quota Alert: $USER exceeded ${LIMIT_MB}MB" admin@example.com <<EOF
User: $USER
Email: $EMAIL

Disk usage exceeded:
Limit: ${LIMIT_MB} MB
Current Usage: ${USAGE_MB} MB

Please take appropriate action.
EOF

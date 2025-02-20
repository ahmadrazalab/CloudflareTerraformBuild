#!/bin/bash

ZONE_ID=""
API_TOKEN=""

# Get all DNS records
records=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
    -H "Authorization: Bearer $API_TOKEN" \
    -H "Content-Type: application/json" | jq -c '.result[]')

# Print Terraform import commands line by line
echo "$records" | while read -r record; do
    id=$(echo "$record" | jq -r '.id')
    name=$(echo "$record" | jq -r '.name' | tr '.' '_')  # Convert dots to underscores for Terraform resource names

    echo "terraform import cloudflare_dns_record.${name} ${ZONE_ID}/${id}"
done

#!/bin/bash
# Run the script, and it will generate all the Terraform import commands.
ZONE_ID=""

API_TOKEN=""

# Get all DNS records
records=$(curl -s -X GET "https://api.cloudflare.com/client/v4/zones/$ZONE_ID/dns_records" \
    -H "Authorization: Bearer $API_TOKEN" \
    -H "Content-Type: application/json" | jq -c '.result[]')

# Generate Terraform resource blocks
echo "$records" | while read -r record; do
    id=$(echo "$record" | jq -r '.id')
    name=$(echo "$record" | jq -r '.name' | tr '.' '_')  # Convert dots to underscores
    type=$(echo "$record" | jq -r '.type')
    content=$(echo "$record" | jq -r '.content')
    proxied=$(echo "$record" | jq -r '.proxied')
    
    # Set TTL
    if [[ "$proxied" == "true" ]]; then
        ttl=1
    else
        ttl=$(echo "$record" | jq -r '.ttl')
    fi

    echo "resource \"cloudflare_dns_record\" \"${name}\" {"
    echo "  zone_id = \"$ZONE_ID\""
    echo "  name    = \"$(echo "$record" | jq -r '.name')\""  # Preserve original name
    echo "  type    = \"$type\""
    echo "  content = \"$content\""
    echo "  proxied = $proxied"
    echo "  ttl     = $ttl"
    echo "}"
    echo ""
done > import.tf

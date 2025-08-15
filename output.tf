output "dns_records" {
  description = "All created Cloudflare DNS records."
  value = {
    for k, rec in cloudflare_dns_record.this : k => {
      id      = rec.id
      name    = rec.name
      type    = rec.type
      content = rec.content
      proxied = rec.proxied
      ttl     = rec.ttl
      hostname = rec.hostname
    }
  }
}

# Sample DNS record
resource "cloudflare_dns_record" "uptime_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "uptime.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27.test.com"
  proxied = true
  ttl     = 1
}


# Sample DNS record
resource "cloudflare_dns_record" "<subdomain>_<domain>_com" {
  zone_id = "<domain-zone-ID>"
  name    = "subdomain.domain.com"
  type    = "CNAME"
  content = "cname-record.test.com"
  proxied = true
  ttl     = 1
}


# Sample DNS record
resource "cloudflare_dns_record" "<subdomain2>_<domain>_com" {
  zone_id = "<domain-zone-ID>"
  name    = "subdomain2.domain.com"
  type    = "A"
  content = "127.0.0.1"
  proxied = true
  ttl     = 1
}
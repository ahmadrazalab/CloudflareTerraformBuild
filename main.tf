resource "cloudflare_dns_record" "cname_record" {
  zone_id = var.cloudflare_zone_id
  name    = "tf.kubecloud.in.net"
  content = "198.51.100.5"
  type    = "A"
  comment = "CNAME record for demoaaplication.com"
  proxied = var.cname_proxied
  ttl     = 1
}





# variable "cloudflare_api_token" {
#   type        = string
#   default = "ub-hQ-REjbsjEM_fRfV9likY0Y4ee2KhTFEx_dEy"
#   description = "Cloudflare API token with DNS edit permissions"
# }

# variable "zone_name" {
#   type        = string
#   description = "The domain name of the Cloudflare zone"
#   default     = "kubecloud.in.net"  # Replace with your domain name
# }


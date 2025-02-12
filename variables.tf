variable "cloudflare_api_token" {
  description = "Cloudflare API token with DNS write permissions"
  type        = string
  sensitive   = true
}

variable "cloudflare_zone_id" {
  description = "Cloudflare Zone ID for the domain"
  type        = string
}


variable "proxied" {
  description = "Whether the CNAME should be proxied through Cloudflare"
  type        = bool
  default     = true
}

variable "nonproxied" {
  description = "Whether the CNAME should be proxied through Cloudflare"
  type        = bool
  default     = false
}

variable "default_ttl" {
  description = "TTL value for the CNAME record"
  type        = number
  default     = 300
}

variable "proxied_ttl" {
  description = "TTL value for the CNAME record"
  type        = number
  default     = 1
}
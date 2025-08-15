variable "records" {
  description = "List of DNS records to create. Each record is an object with name, type, content, ttl, proxied, and optional priority/comment."
  type = list(object({
    name     = string
    type     = string
    content  = string
    ttl      = number
    proxied  = bool
    priority = optional(number)
    comment  = optional(string)
  }))
}
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

variable "alb_dns_name" {
  description = "The DNS name of the ALB from the Ingress"
  type        = string
}

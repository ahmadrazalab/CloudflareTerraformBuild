

resource "cloudflare_dns_record" "this" {
  for_each = { for rec in var.records : "${rec.name}_${rec.type}" => rec }
  zone_id  = var.cloudflare_zone_id
  name     = each.value.name
  type     = each.value.type
  content  = each.value.content
  ttl      = each.value.ttl
  proxied  = each.value.proxied
  priority = lookup(each.value, "priority", null)
  comment  = lookup(each.value, "comment", null)
}


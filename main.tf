resource "cloudflare_dns_record" "loadapi_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "loadapi.kubecloud.in.net"
  type    = "A"
  content = "34.131.172.45"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "socket_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "socket.kubecloud.in.net"
  type    = "A"
  content = "143.244.130.166"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "sonar_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "sonar.kubecloud.in.net"
  type    = "A"
  content = "134.209.146.238"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "tf_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "tf.kubecloud.in.net"
  type    = "A"
  content = "198.51.100.5"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "tlstest_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "tlstest.kubecloud.in.net"
  type    = "A"
  content = "98.70.11.66"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "book_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "book.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "cf_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "cf.kubecloud.in.net"
  type    = "CNAME"
  content = "alb-641652344.ap-south-1.elb.amazonaws.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "_de4054ba820a4da3d208f960aec149f7_chat_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "_de4054ba820a4da3d208f960aec149f7.chat.kubecloud.in.net"
  type    = "CNAME"
  content = "4ced565e065ddd4bfb0fcf3c713fa3f9.655b4483d24abaaf703be50d76c68c5f.6d7ee2c22378d69.comodoca.com"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "docker_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "docker.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "_f50e08bd57bf94e0d725b1527f8ea355_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "_f50e08bd57bf94e0d725b1527f8ea355.kubecloud.in.net"
  type    = "CNAME"
  content = "_c195f8f952d11c7c7c9580b3d73b58a2.sdgjtdhdhz.acm-validations.aws"
  proxied = false
  ttl     = 1
}

resource "cloudflare_dns_record" "localhostserverport_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "localhostserverport.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "mail_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "mail.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "minikube_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "minikube.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "minio_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "minio.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "pp-dockerizeit_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "pp-dockerizeit.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "pp-nmap_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "pp-nmap.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "seafile_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "seafile.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "ssh_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "ssh.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}

resource "cloudflare_dns_record" "uptime_kubecloud_in_net" {
  zone_id = "947884535b3bc67c60b37af84c91a744"
  name    = "uptime.kubecloud.in.net"
  type    = "CNAME"
  content = "abbeeaba-8aa1-4ac3-ae27-5e522517e80d.cfargotunnel.com"
  proxied = true
  ttl     = 1
}


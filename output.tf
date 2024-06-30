locals {
  ip_address = data.external.my_ip.result.ip
}

output "ip_address" {
  value = local.ip_address
}
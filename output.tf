locals {
  ip_address = data.http.my_ip.result.ip
}

output "ip_address" {
  value = local.ip_address
}
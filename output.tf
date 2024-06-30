locals {
  ip_address = data.http.myip.result.ip
}

output "ip_address" {
  value = local.ip_address
}
locals {
  ip_address = data.http.myip.response_body
}

output "ip_address" {
  value = local.ip_address
}
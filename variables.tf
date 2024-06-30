variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t3.nano"
}

variable "external_ip" {
  description = "External IP address"
  type        = string
}
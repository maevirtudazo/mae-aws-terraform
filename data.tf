data "aws_ami" "app_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu-2204-standard-1696268698"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["303888194707"]
}

data "aws_vpc" "default" {
  default = true
}

data "http" "myip" {
  url = "https://ipinfo.io/ip"
}
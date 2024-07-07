resource "aws_security_group" "main" {
  name = "main_firewall"
  tags = {
    Terraform = "true"
  }
  vpc_id = data.aws_vpc.default.id
}

resource "aws_security_group_rule" "http_in" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  security_group_id = aws_security_group.main.id
}


resource "aws_security_group_rule" "https_in" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["${chomp(data.http.myip.response_body)}/32"]
  security_group_id = aws_security_group.main.id
}

#resource "aws_vpc" "my_vpc" {
#  cidr_block = "10.0.0.0/16"
#}

resource "aws_subnet" "subnet1" {
  vpc_id = data.aws_vpc.default.id
  cidr_block = "10.0.0.0/28"
}

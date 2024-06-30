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
  cidr_blocks = var.external_ip
  security_group_id = aws_security_group.main.id
}


resource "aws_security_group_rule" "https_in" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = var.external_ip
  security_group_id = aws_security_group.main.id
}
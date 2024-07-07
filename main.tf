resource "aws_instance" "frontend-1" {
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = "mae"
  instance_initiated_shutdown_behavior = "stop" 

  tags = {
    Name = "frontend-1"
  }
}

resource "aws_instance" "frontend-2" {
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = "mae"
  instance_initiated_shutdown_behavior = "stop" 

  tags = {
    Name = "frontend-2"
  }
}

resource "aws_instance" "frontend-3" {
  ami                    = data.aws_ami.app_ami.id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.main.id]
  key_name               = "mae"
  instance_initiated_shutdown_behavior = "stop" 

  tags = {
    Name = "frontend-3"
  }
}

#resource "aws_instance" "load-balancer" {
#  ami                    = data.aws_ami.app_ami.id
#  instance_type          = var.instance_type
#  vpc_security_group_ids = [aws_security_group.main.id]
#  key_name               = "mae"
#  instance_initiated_shutdown_behavior = "stop" 

#  tags = {
#    Name = "load-balancer"
#  }
#}

resource "aws_lb" "my_lb" {
  name               = "my-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = [aws_subnet.subnet1.id,aws_subnet.subnet2.id]
}
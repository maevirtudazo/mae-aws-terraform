resource "aws_lb_target_group" "my_target_group" {
  name     = "lb-target-group"
  port     = 8080
  protocol = "HTTP"
  vpc_id = data.aws_vpc.default.id
}

resource "aws_lb_listener" "my_frontend_listener" {
  load_balancer_arn = aws_lb.my_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

resource "aws_lb" "my_lb" {
  name               = "my-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = [aws_subnet.subnet1.id,aws_subnet.subnet2.id]
}
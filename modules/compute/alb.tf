# Single load balancer
resource "aws_lb" "web_alb" {
  name               = "web-alb"
  internal           = false
  idle_timeout       = "300"
  load_balancer_type = "application"
  security_groups    = [ var.http_sg_id ]
  subnets = [
    var.public_subnet_id_1,
    var.public_subnet_id_2
  ]

  enable_deletion_protection = false

  tags = {
    Name = "web-alb"
  }
}

# Define a target group
resource "aws_lb_target_group" "web_alb" {
  name     = "web-alb-tg"
  port     = 5000
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Define a listener
resource "aws_lb_listener" "web_alb" {
  load_balancer_arn = aws_lb.web_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_alb.arn
  }
}

# Define a listener rule
resource "aws_lb_listener_rule" "web_alb" {
  listener_arn = aws_lb_listener.web_alb.arn
  priority     = 99

  action {
    type = "forward"
    target_group_arn = aws_lb_target_group.web_alb.arn
  }

  condition {
    path_pattern  {
    values = [
      "/",
      "/login",
      "/logout"
    ]
    }
  }
}

output "alb_dns_name" {
  value = aws_lb.web_alb.dns_name
}
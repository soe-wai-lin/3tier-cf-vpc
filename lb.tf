resource "aws_lb" "web_lb" {
  name               = "web-asg"
  load_balancer_type = "application"
  internal           = false
  subnets = [
    aws_subnet.terra_vpc_pub_01.id,
    aws_subnet.terra_vpc_pub_02.id
  ]
  security_groups = [aws_security_group.web-sg.id]
}

resource "aws_lb_listener" "web_lb" {
  load_balancer_arn = aws_lb.web_lb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_tg.arn
  }
}

resource "aws_lb" "app_lb" {
  name               = "app-svr"
  load_balancer_type = "application"
  internal           = true
  subnets = [
    aws_subnet.terra_vpc_priv_01.id,
    aws_subnet.terra_vpc_priv_02.id
  ]
  security_groups = [aws_security_group.app-sg.id]
}

resource "aws_lb_listener" "app_lb" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"


  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

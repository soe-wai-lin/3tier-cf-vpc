
resource "aws_autoscaling_group" "app_asg" {
  max_size         = var.asg_max
  min_size         = var.asg_min
  desired_capacity = var.asg_desired_capacity
  vpc_zone_identifier = [
    aws_subnet.terra_vpc_priv_01.id,
    aws_subnet.terra_vpc_priv_02.id
  ]
  target_group_arns = [
    aws_lb_target_group.app_tg.arn
  ]

  launch_template {
    id = aws_launch_template.app_template.id
  }
}

resource "aws_lb_target_group" "app_tg" {
  name     = "app-svr-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.terra_vpc.id
  # Add any other configuration like health checks
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_autoscaling_group" "web_asg" {
  max_size         = 2
  min_size         = 2
  desired_capacity = 2
  vpc_zone_identifier = [
    aws_subnet.terra_vpc_pub_01.id,
    aws_subnet.terra_vpc_pub_02.id
  ]
  target_group_arns = [
    aws_lb_target_group.web_tg.arn
  ]

  launch_template {
    id = aws_launch_template.web_template.id
  }
}

resource "aws_lb_target_group" "web_tg" {
  name     = "web-svr-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.terra_vpc.id
  # Add any other configuration like health checks
  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 15
    timeout             = 3
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

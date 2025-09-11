resource "aws_launch_template" "web_template" {
  image_id      = var.image_id
  instance_type = var.instance_type

  vpc_security_group_ids = [aws_security_group.web-sg.id]


  user_data = filebase64("${path.module}/web.sh")

  key_name = var.key_name

}

resource "aws_launch_template" "app_template" {
  image_id      = var.image_id
  instance_type = var.instance_type


  vpc_security_group_ids = [aws_security_group.app-sg.id]


  user_data = filebase64("${path.module}/app.sh")

  key_name = var.key_name

}



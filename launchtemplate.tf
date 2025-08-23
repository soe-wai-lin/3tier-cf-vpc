resource "aws_launch_template" "web_template" {
  image_id      = "ami-0779c82fbb81e731c"
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.web-sg.id]


  user_data = filebase64("${path.module}/web.sh")

  key_name = "phue"

}

resource "aws_launch_template" "app_template" {
  image_id      = "ami-0779c82fbb81e731c"
  instance_type = "t2.micro"


  vpc_security_group_ids = [aws_security_group.app-sg.id]


  user_data = filebase64("${path.module}/app.sh")

  key_name = "phue"

}



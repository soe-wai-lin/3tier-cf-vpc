resource "aws_security_group" "app-sg" {
  name        = "app-sg"
  description = "ssh access"
  vpc_id      = aws_vpc.terra_vpc.id

  tags = {
    Name = "app-sg"
  }
}
resource "aws_security_group_rule" "allow__ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.web-sg.id
  security_group_id        = aws_security_group.app-sg.id
}

resource "aws_security_group_rule" "allow__ssh_from_bastion" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.bastion-sg.id
  security_group_id        = aws_security_group.app-sg.id
}

resource "aws_security_group_rule" "ping" {
  type                     = "ingress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "icmp"
  source_security_group_id = aws_security_group.web-sg.id
  security_group_id        = aws_security_group.app-sg.id
}


resource "aws_security_group_rule" "allow_outbond" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.app-sg.id
}


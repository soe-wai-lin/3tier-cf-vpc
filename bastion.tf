resource "aws_instance" "bastion_host" {
  ami                    = "ami-0779c82fbb81e731c"
  instance_type          = "t2.micro"
  key_name               = "phue"
  subnet_id              = aws_subnet.terra_vpc_pub_01.id
  vpc_security_group_ids = [aws_security_group.bastion-sg.id]
  tags = {
    Name = "bastion"
  }
}

resource "aws_security_group" "bastion-sg" {
  name        = "bastion-sg"
  description = "ssh access"
  vpc_id      = aws_vpc.terra_vpc.id


}
resource "aws_security_group_rule" "bastion_allow_ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion-sg.id
}

resource "aws_security_group_rule" "bastion_allow_outbond" {
  type              = "egress"
  to_port           = 0
  protocol          = "-1"
  from_port         = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.bastion-sg.id
}
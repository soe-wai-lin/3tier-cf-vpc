resource "aws_security_group" "db-sg" {
  name   = "db-sg"
  vpc_id = aws_vpc.terra_vpc.id

}
resource "aws_security_group_rule" "allow_mysql" {
  type                     = "ingress"
  from_port                = 3306
  to_port                  = 3306
  protocol                 = "tcp"
  source_security_group_id = aws_security_group.app-sg.id
  security_group_id        = aws_security_group.db-sg.id
}



resource "aws_security_group_rule" "db_allow_outbond" {
  type                     = "egress"
  to_port                  = 0
  protocol                 = "-1"
  from_port                = 0
  source_security_group_id = aws_security_group.app-sg.id
  security_group_id        = aws_security_group.db-sg.id
}


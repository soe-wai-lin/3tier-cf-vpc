

resource "aws_db_subnet_group" "my_db_subnet_group" {
  name = "db-sn"
  subnet_ids = [
    aws_subnet.terra_vpc_data_01.id, # Replace with your subnet IDs
    aws_subnet.terra_vpc_data_02.id
  ]
  depends_on = [aws_vpc.terra_vpc]
}

resource "aws_db_instance" "mysql_rds" {
  identifier           = var.identifier
  engine               = "mysql"
  engine_version       = "8.0"
  allocated_storage    = var.rds_allocated_storage
  instance_class       = var.rds_instance_class
  username             = var.rds_username
  password             = var.rds_password # Using a variable is a better practice
  skip_final_snapshot  = true
  parameter_group_name = "default.mysql8.0"
  db_subnet_group_name = aws_db_subnet_group.my_db_subnet_group.name
  vpc_security_group_ids = [
    aws_security_group.db-sg.id
  ]
  depends_on = [aws_db_subnet_group.my_db_subnet_group]
}

# resource "aws_db_instance" "replica" {
#   identifier              = "mydb-01-replica"
#   replicate_source_db     = aws_db_instance.mysql_rds.arn
#   instance_class          = "db.t3.micro"
#   publicly_accessible     = false
#   skip_final_snapshot     = true
#   backup_retention_period = 1


#   # networking (should be in same VPC or peered VPC)
#   # vpc_security_group_ids  = [
#   #   aws_security_group.db_sg.id
#   # ]
#   depends_on = [aws_db_subnet_group.my_db_subnet_group]
#   db_subnet_group_name    = aws_db_subnet_group.my_db_subnet_group.name
# }
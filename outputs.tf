output "vpc_id" {
  value       = aws_vpc.terra_vpc.id
  description = "VPC ID"
}

output "pub_sub_01_id" {
  value       = aws_subnet.terra_vpc_pub_01.id
  description = "ID of terra_vpc_pub_01"
}

output "pub_sub_02_id" {
  value       = aws_subnet.terra_vpc_pub_02.id
  description = "ID of terra_vpc_pub_02"
}

output "priv_sub_01_id" {
  value       = aws_subnet.terra_vpc_priv_01.id
  description = "ID of terra_vpc_priv_01"
}

output "priv_sub_02_id" {
  value       = aws_subnet.terra_vpc_priv_02.id
  description = "ID of terra_vpc_priv_02"
}

output "data_01_id" {
  value       = aws_subnet.terra_vpc_data_01.id
  description = "ID of terra_vpc_data_01"
}

output "data_02_id" {
  value       = aws_subnet.terra_vpc_data_02.id
  description = "ID of terra_vpc_data_02"
}

output "cloudfront" {
  value = aws_cloudfront_distribution.alb_cf.domain_name
}

output "web-lb" {
  value       = aws_lb.web_lb.dns_name
  description = "DNS name of web tier loadbalancer"
}

output "app-lb" {
  value       = aws_lb.app_lb.dns_name
  description = "DNS name of app tier loadbalancer"
}

output "RDS-endpoint" {
  value       = aws_db_instance.mysql_rds.endpoint
  description = "RDS endpoint name"
}

output "route_53_alb" {
  value       = aws_route53_record.alb.name
  description = "Route53 map with web-asg"
}
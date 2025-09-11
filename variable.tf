variable "aws_profile" {
  type        = string
  default     = "default"
  description = "Check this profile name in ~/.aws/config"
}

variable "aws_region" {
  default = "ap-southeast-1"
  type    = string
}

variable "vpc_name" {
  default = "terra_vpc"
}

variable "vpc_cidr_block" {
  default = "20.0.0.0/16"
  type    = string
}

variable "pub_sub_01" {
  default = "20.0.1.0/24"
  type    = string
}

variable "pub_sub_02" {
  default = "20.0.2.0/24"
  type    = string
}

variable "priv_sub_01" {
  default = "20.0.10.0/24"
  type    = string
}

variable "priv_sub_02" {
  default = "20.0.11.0/24"
  type    = string
}

variable "data_sub_01" {
  default = "20.0.20.0/24"
  type    = string
}

variable "data_sub_02" {
  default = "20.0.21.0/24"
  type    = string
}

variable "rds_allocated_storage" {
  default = 20
  type    = number
}

variable "rds_instance_class" {
  default = "db.t3.micro"
  type    = string
}

variable "rds_username" {
  default = "admin"
  type    = string
}

variable "rds_password" {
  default = "153709Swl$%"
}

variable "identifier" {
  default = "mydb-01"
  type    = string
}

variable "image_id" {
  default = "ami-0779c82fbb81e731c"
  type    = string
}

variable "instance_type" {
  default = "t2.micro"
  type    = string
}

variable "key_name" {
  default = "jenkins-key"
  type    = string
}

variable "asg_min" {
  default = 2
  type    = number
}

variable "asg_max" {
  default = 2
  type    = number
}

variable "asg_desired_capacity" {
  default = 2
  type    = number
}

variable "alb_route53" {
  default     = "www.swlinux.click"
  type        = string
  description = "Route53 map with web-asg"
}

resource "aws_route53_record" "www" {
  zone_id = "Z07696672FJAT8VAUYVQ9"
  name    = var.alb_route53
  type    = "A"
  alias {
    name                   = aws_lb.web_lb.dns_name
    zone_id                = aws_lb.web_lb.zone_id
    evaluate_target_health = false
  }
}



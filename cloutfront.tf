# --- CloudFront Distribution ---
resource "aws_cloudfront_distribution" "alb_cf" {
  enabled             = true
  comment             = "CloudFront in front of ALB"
  default_root_object = ""
  depends_on = [ aws_autoscaling_group.web_asg ]

  origin {
    domain_name = aws_lb.web_lb.dns_name
    origin_id   = "alb-origin"

    custom_origin_config {
      http_port              = 80
      https_port             = 443
      origin_protocol_policy = "http-only" # Or "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "alb-origin"

    forwarded_values {
      query_string = true
      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  
  viewer_certificate {
    # acm_certificate_arn      = aws_acm_certificate.cert.arn
    # ssl_support_method       = "sni-only"
    # minimum_protocol_version = "TLSv1.2_2021"
    cloudfront_default_certificate = true # ✅ No ACM needed, uses default *.cloudfront.net cert
  }
}

# --- ACM Certificate (must be in us-east-1 for CloudFront) ---
# resource "aws_acm_certificate" "cert" {
#   domain_name       = "swl.joindti.site"
#   validation_method = "DNS"
#   region = "us-east-1"

#   lifecycle {
#     create_before_destroy = true
#   }
# }
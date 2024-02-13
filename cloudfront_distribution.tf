resource "aws_cloudfront_distribution" "xldp_xgrid_co" {
  origin {
    domain_name = "${aws_s3_bucket.xldp_xgrid_co.bucket}.s3.amazonaws.com"
    origin_id   = "S3-${aws_s3_bucket.xldp_xgrid_co.bucket}"

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.xldp_oai.cloudfront_access_identity_path
    }
  }

  enabled             = true
  default_root_object = "index.html"
  aliases             = ["xldp.xgrid.co"]

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${aws_s3_bucket.xldp_xgrid_co.bucket}"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    viewer_protocol_policy = "redirect-to-https"
  }

  viewer_certificate {
    acm_certificate_arn = aws_acm_certificate.xldp_xgrid_co.arn
    ssl_support_method  = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  tags = {
    Environment = "Development",
    name        = "Mikel"
  }
}

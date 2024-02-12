# Step 3: Create Route 53 record
resource "aws_route53_record" "xldp_xgrid_co" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.xldp_xgrid_co.domain_name
    zone_id                = aws_cloudfront_distribution.xldp_xgrid_co.hosted_zone_id
    evaluate_target_health = false
  }
}

# Step 5: Create Route 53 records for ACM validation
resource "aws_route53_record" "acm_validation" {
  count   = length(aws_acm_certificate.xldp_xgrid_co.domain_validation_options)
  name    = element(aws_acm_certificate.xldp_xgrid_co.domain_validation_options.*.resource_record_name, count.index)
  type    = element(aws_acm_certificate.xldp_xgrid_co.domain_validation_options.*.resource_record_type, count.index)
  zone_id = var.zone_id
  records = [element(aws_acm_certificate.xldp_xgrid_co.domain_validation_options.*.resource_record_value, count.index)]
  ttl     = 60
}

# Step 9: Create Route 53 record for CloudFront Distribution
resource "aws_route53_record" "cloudfront_xldp_xgrid_co" {
  zone_id = var.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.xldp_xgrid_co.domain_name
    zone_id                = aws_cloudfront_distribution.xldp_xgrid_co.hosted_zone_id
    evaluate_target_health = false
  }
}

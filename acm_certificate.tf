# Step 4: Create ACM Certificate
resource "aws_acm_certificate" "xldp_xgrid_co" {
  domain_name       = "xldp.xgrid.co"
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}

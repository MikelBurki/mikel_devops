
# Step 7: Create OAI
resource "aws_cloudfront_origin_access_identity" "xldp_oai" {
  comment = var.cloudfront_oai_comment
}

# Step 8: Update S3 Bucket Policy
data "aws_iam_policy_document" "cloudfront_bucket_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.xldp_xgrid_co.arn}/*"]
    principals {
      type        = "AWS"
      identifiers = ["arn:aws:iam::cloudfront:user/CloudFront Origin Access Identity ${aws_cloudfront_origin_access_identity.xldp_oai.id}"]
    }
  }
}

resource "aws_s3_bucket_policy" "cloudfront_bucket_policy" {
  bucket = aws_s3_bucket.xldp_xgrid_co.id
  policy = data.aws_iam_policy_document.cloudfront_bucket_policy.json
}

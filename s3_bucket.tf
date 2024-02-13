# Step 1: Create S3 Bucket
resource "aws_s3_bucket" "xldp_xgrid_co" {
  bucket = var.bucket_name
  website {
    index_document = "index.html"
  }

  tags = {
    Environment = "Development",
    name        = "Mikel"
  }
}

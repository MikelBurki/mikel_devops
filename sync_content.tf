# Step 2: Sync contents to S3 Bucket
resource "null_resource" "sync_build_folder" {
  provisioner "local-exec" {
    command = "aws s3 sync ${var.build_folder_path} s3://${aws_s3_bucket.xldp_xgrid_co.bucket}"
  }
  depends_on = [aws_s3_bucket.xldp_xgrid_co]
}

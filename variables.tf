variable "aws_region" {
  description = "The AWS region in which resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "bucket_name" {
  description = "The name of the S3 bucket to be created."
  type        = string
  default     = "xldp.xgrid.co"
}

variable "domain_name" {
  description = "The domain name for the ACM certificate and Route 53 records."
  type        = string
  default     = "xldp.xgrid.co"
}

variable "zone_id" {
  description = "The Zone ID for the Route 53 DNS records."
  type        = string
  default     = "Z04915193OVBRMG8HX327"
}

variable "build_folder_path" {
  description = "Path to the build folder to sync with the S3 bucket."
  type        = string
  default     = "build/"
}

variable "cloudfront_oai_comment" {
  description = "Comment for the CloudFront Origin Access Identity."
  type        = string
  default     = "xldp.xgrid.co OAI"
}

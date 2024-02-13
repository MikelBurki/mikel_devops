variable "aws_region" {
  description = "The AWS region in which resources will be created."
  type        = string
  default     = ""
}

variable "bucket_name" {
  description = "The name of the S3 bucket to be created."
  type        = string
  default     = ""
}

variable "domain_name" {
  description = "The domain name for the ACM certificate and Route 53 records."
  type        = string
  default     = ""
}

variable "zone_id" {
  description = "The Zone ID for the Route 53 DNS records."
  type        = string
  default     = ""
}

variable "build_folder_path" {
  description = "Path to the build folder to sync with the S3 bucket."
  type        = string
  default     = ""
}

variable "cloudfront_oai_comment" {
  description = "Comment for the CloudFront Origin Access Identity."
  type        = string
  default     = ""
}
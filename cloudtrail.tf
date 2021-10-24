data "aws_caller_identity" "current" {}

resource "aws_cloudtrail" "week8-ct" {
  name                          = "week8-ct"
  s3_bucket_name                = aws_s3_bucket.week8.id
  s3_key_prefix                 = "prefix"
  include_global_service_events = true
  is_multi_region_trail         = true

}

resource "aws_s3_bucket" "week8" {
  bucket        = "ece592-cloudtrail-rechinj"
  force_destroy = true


  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "arn:aws:s3:::ece592-cloudtrail-rechinj"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::ece592-cloudtrail-rechinj/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}

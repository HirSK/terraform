provider "aws" {
    access_key = "AKIAIZRRIJQWKRHD2UZA"
    secret_key = "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"
    region = "us-west-1"
}

resource "aws_s3_bucket" "bucket" {
    bucket  = "session-terraform-sir-1"
    acl     = "public-read"

  tags {
    Name        = "Session"
    Environment = "Dev"
  }

policy = <<POLICY
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "OAIGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": ["arn:aws:s3:::session-terraform-sir-1/*"]
        }
    ]
}
POLICY
}
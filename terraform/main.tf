provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "rickmorty" {
  bucket = "meu-bucket-rickmorty"

  tags = {
    Name        = "RickMortyMemoryGame"
    Environment = "Production"
  }
}

resource "aws_s3_bucket_website_configuration" "rickmorty" {
  bucket = aws_s3_bucket.rickmorty.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_policy" "public_access" {
  bucket = aws_s3_bucket.rickmorty.id
  policy = <<POLICY
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::meu-bucket-rickmorty/*"
    }
  ]
}
POLICY
}

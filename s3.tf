# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"  # Choose your preferred region
}

resource "aws_s3_bucket" "test-website-bucket" {
  bucket = "test-website-bucket-1993"

  tags = {
    Name        = "test-website-bucket-1993"
    Environment = "Labs"
    Owner       = "Platform"
  }
}


resource "aws_s3_bucket_website_configuration" "website_hosting" {
  bucket = aws_s3_bucket.test-website-bucket.id

  index_document {
    suffix = "index.html"
  }
}


# Make the bucket publicly accessible
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket = aws_s3_bucket.test-website-bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

# Create a bucket policy to allow public read access
resource "aws_s3_bucket_policy" "allow_public_access" {
  bucket = aws_s3_bucket.test-website-bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.test-website-bucket.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.public_access]
}

# Upload the HTML file to the bucket
resource "aws_s3_object" "index_html" {
  bucket       = aws_s3_bucket.test-website-bucket.id
  key          = "index.html"
  source       = "index.html"
  content_type = "text/html"
  etag         = filemd5("index.html")
}

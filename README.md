# AWS S3 Static Website Hosting with Terraform

## Overview

This project demonstrates how to deploy a static website on AWS S3 using Terraform. The configuration creates a publicly accessible S3 bucket configured for static website hosting, with an example HTML file.

## Prerequisites

Before you begin, ensure you have the following installed:

- AWS CLI
- Terraform 
- An AWS account with appropriate permissions

## Project Structure

```
.
├── s3.tf          # Primary Terraform configuration
├── index.html       # Example website HTML file
└── README.md        # Project documentation
```

### Terraform Resources Created

- S3 Bucket with a unique name
- Bucket website configuration
- Public access policy
- HTML file upload


### 2. Initialize Terraform

```
terraform init
```

### 3. Plan the Deployment

```
terraform plan
```

### 4. Apply the Configuration

```
terraform apply
```

When prompted, type `yes` to confirm.


## Cleanup

To remove all resources:

```
terraform destroy
```


## Potential Future Enhancements

If I had more time to develop this website, I would enhance it with several advanced features and best practices across different AWS services:

### 1. Content Delivery and Performance
- Implement Amazon CloudFront for global content distribution
- Add CDN caching to reduce latency

ALternative solutions that you could have taken but didn't and why?
### 1. EC2 instance with Nginx
- EC2 and Nginx is better for dynamic websites
- Complex solution for static website hosting
- Cost efficiency


What would be required to make this production grade website
- I have already used IAC to deploy the s3 bucket and host the website.
- Configure SSL/HTTPS with AWS Certificate Manager
- I would add CDN caching
- I would add a domain name to access the website instead of using bucket website endpoint
- I would enable access logging for s3 bucket

# AWS S3 Static Website Hosting with Terraform

## Overview

This project demonstrates how to deploy a static website on AWS S3 using Terraform. The configuration creates a publicly accessible S3 bucket configured for static website hosting, with an example HTML file.

## Prerequisites

Before you begin, ensure you have the following installed:

- AWS CLI
- Terraform (version 1.0 or later)
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

## Outputs

After successful deployment, Terraform will output the website endpoint URL.

## Cleanup

To remove all resources:

```
terraform destroy
```

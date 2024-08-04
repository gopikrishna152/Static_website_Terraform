# AWS S3 Static Website Hosting with Terraform

This repository contains Terraform configuration to set up an S3 bucket for hosting a static website on AWS. The Terraform script configures the bucket, uploads website files, and enables static website hosting.

## Prerequisites

- An AWS account
- [Terraform](https://www.terraform.io/downloads) installed
- AWS CLI installed and configured

## Configuration Steps

1. **Clone the Repository**

   ```bash
   git clone https://github.com/gopikrishna152/Static_website_Terraform.git
   cd Static_website_Terraform
   ```
   
   
2. **Configure AWS CLI**

   Ensure that you have AWS CLI installed and configured. Run the following command and provide your AWS credentials:
   ```bash
   aws configure
   ```

   You'll be prompted to enter your AWS Access Key ID, Secret Access Key, Default Region Name, and Default Output Format.<br>
3. **Initialize Terraform**

   Initialize Terraform to download the necessary provider plugins:
   ```bash
   terraform init
   
4. **Review Changes**

Review the changes that Terraform will make to your AWS environment:
  ```bash
 terraform plan
```
  This command will show you a preview of the changes that will be applied.

5.  **Apply Configuration**

Apply the Terraform configuration to create the S3 bucket and upload the website files:

  ```bash
 terraform apply
  ```
  You will be prompted to confirm that you want to apply the changes. Type yes to proceed.

6. **Access the Website**

Once the configuration is applied successfully, Terraform will output the URL of the static website. You can access your website using this URL.

**File Structure**
main.tf: Contains Terraform configuration for S3 bucket setup and website hosting.
html/: Directory containing website files including HTML, CSS, JS, and images.

  **Notes**
Ensure that your html/ directory contains the necessary files (index.html, error.html, CSS files, JS files, and images).
Adjust the bucketname variable in main.tf if needed.

  **Troubleshooting**

**File Access Issues**: Ensure that files are correctly uploaded and the public-read ACL is set for all objects.

**AWS Credentials**: Verify your AWS credentials if you encounter authentication issues.

Feel free to open an issue or submit a pull request if you have any questions or improvements!

**Author**: Gopikrishna

**Repository**: https://github.com/gopikrishna152/Static_website_Terraform









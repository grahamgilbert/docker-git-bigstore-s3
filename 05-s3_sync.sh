#!/bin/bash

# Get s3 creds from env var and write to password file
mkdir -p ~/.aws
echo '[default]' >> ~/.aws/credentials
echo "aws_access_key_id=${S3_IDENTITY}" >> ~/.aws/credentials
echo "aws_secret_access_key=${S3_CREDENTIAL}" >> ~/.aws/credentials
# Mount s3 bucket from environment variable
# mkdir -p ${TARGET_DIR}
# s3fs -o nonempty $S3_BUCKET ${TARGET_DIR}
cd ${TARGET_DIR}
aws s3 sync . s3://$S3_BUCKET --delete --exclude ".git/*"

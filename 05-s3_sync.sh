#!/bin/bash

# Get s3 creds from env var and write to password file
mkdir -p ~/.aws
echo '[default]\naws_access_key_id=${S3_IDENTITY}\naws_secret_access_key=${S3_CREDENTIAL}' >> ~/.aws/credentials
# Mount s3 bucket from environment variable
# mkdir -p ${TARGET_DIR}
# s3fs -o nonempty $S3_BUCKET ${TARGET_DIR}
aws s3 sync ${TARGET_DIR} s3://$S3_BUCKET --delete

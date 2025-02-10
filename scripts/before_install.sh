#!/bin/bash
echo Region - $AWS_DEFAULT_REGION
echo Account ID - $AWS_ACCOUNT_ID
cat /home/ec2-user/.env
x=$(whoami)
echo whoami - $x

# AWS CLI command to retrieve secrets
SECRET_NAME="data_lens_secrets"
REGION="us-west-2"

# Retrieve the secret value
SECRET_VALUE=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME --region $REGION --query SecretString --output text)

# Parse the JSON response
ACCOUNT_ID=$(echo $SECRET_VALUE | jq -r '.ACCOUNT_ID')
REGION=$(echo $SECRET_VALUE | jq -r '.REGION')
DEFAULT_REGION=REGION

aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com
if [ $? -eq 0 ]; then
  echo "Successfully logged in to ECR."
else
  echo "Failed to log in to ECR."
  exit 1
fi


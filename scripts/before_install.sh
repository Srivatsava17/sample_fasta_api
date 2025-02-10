#!/bin/bash


# AWS CLI command to retrieve secrets
SECRET_NAME="data_lens_secrets"
AWS_DEFAULT_REGION="us-west-2"
AWS_ACCOUNT_ID='528503375915'

# Retrieve the secret value
# SECRET_VALUE=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME --region $AWS_DEFAULT_REGION --query SecretString --output text)

# # Parse the JSON response
# AWS_ACCOUNT_ID=$(echo $SECRET_VALUE | jq -r '.ACCOUNT_ID')
# AWS_DEFAULT_REGION=$(echo $SECRET_VALUE | jq -r '.REGION')

echo Region - $AWS_DEFAULT_REGION
echo Account ID - $AWS_ACCOUNT_ID

# aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com
if [ $? -eq 0 ]; then
  echo "Successfully logged in to ECR."
else
  echo "Failed to log in to ECR."
  exit 1
fi


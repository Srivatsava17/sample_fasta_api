#!/bin/bash
echo Region - $AWS_DEFAULT_REGION
echo Account ID - $AWS_ACCOUNT_ID
aws ecr get-login-password --region $AWS_DEFAULT_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_DEFAULT_REGION.amazonaws.com
if [ $? -eq 0 ]; then
  echo "Successfully logged in to ECR."
else
  echo "Failed to log in to ECR."
  exit 1
fi

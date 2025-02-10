#!/bin/bash

# AWS CLI command to retrieve secrets
SECRET_NAME="data_lens_secrets"
REGION="us-west-2"

# Retrieve the secret value
SECRET_VALUE=$(aws secretsmanager get-secret-value --secret-id $SECRET_NAME --region $REGION --query SecretString --output text)

# Parse the JSON response
ACCOUNT_ID=$(echo $SECRET_VALUE | jq -r '.ACCOUNT_ID')
REGION=$(echo $SECRET_VALUE | jq -r '.REGION')

# Write the environment variables to env.sh
echo "export ACCOUNT_ID=$ACCOUNT_ID" > env.sh
echo "export REGION=$REGION" >> env.sh

# Make env.sh executable
chmod +x env.sh

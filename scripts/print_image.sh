#!/bin/bash

# Read the image ID from the file
IMAGE_ID=$(cat /home/ec2-user/app/image_id.txt)
echo "Using image ID: $IMAGE_ID"

#!/bin/bash
set -e

echo "Pulling latest Docker image from ECR..."
aws ecr get-login-password --region ap-southeast-1 | \
docker login --username AWS --password-stdin 743771860848.dkr.ecr.ap-southeast-1.amazonaws.com

docker pull 743771860848.dkr.ecr.ap-southeast-1.amazonaws.com/myapp:latest

echo "Restarting application container..."
docker stop myapp || true
docker rm myapp || true

docker run -d --name myapp -p 80:80 743771860848.dkr.ecr.ap-southeast-1.amazonaws.com/myapp:latest
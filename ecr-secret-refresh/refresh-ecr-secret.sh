#!/bin/bash

AWS_REGION="ap-northeast-2"
AWS_ACCOUNT_ID="054037113048"
EMAIL="hnnynh125@gmail.com"
CLUSTER_NAME="eks-default"

echo "========== Installing AWS CLI... =========="

apt-get update && \
apt-get install -y curl unzip && \
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
./aws/install && \

echo "========== AWS CLI installed successfully =========="


echo "========== Installing kubectl... =========="

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
chmod +x kubectl && \
mv kubectl /usr/local/bin/ && \

echo "========== kubectl installed successfully =========="


echo "========== Retrieving ECR login password... =========="

TOKEN=$(aws ecr get-login-password --region $AWS_REGION)

echo "========== Creating and applying Kubernetes secret for ECR... =========="

kubectl create secret docker-registry ecr-secret \
    --docker-server=${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com \
    --docker-username=AWS \
    --docker-password=$TOKEN \
    --docker-email=$EMAIL \
    --namespace=devops-tools \
    --dry-run=client -o yaml | kubectl apply -f - && \
    
echo "========== ECR secret applied successfully =========="


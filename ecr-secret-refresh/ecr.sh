#!/bin/sh
aws ecr --region ap-northeast-2 get-authorization-token --output text --query 'authorizationData[].authorizationToken' | base64 -d
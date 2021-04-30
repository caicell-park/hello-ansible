#!/bin/bash

echo "[all]" > inventory
aws ec2 describe-instances \
   --query 'Reservations[*].Instances[*].PublicIpAddress' \
   --output text >> inventory

echo "" >> inventory
echo "[udacity]" >> inventory
aws ec2 describe-instances \
   --query 'Reservations[*].Instances[*].PublicIpAddress' \
   --filters "Name=tag:Project,Values=udacity" \
   --output text >> inventory

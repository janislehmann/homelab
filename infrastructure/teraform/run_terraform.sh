#!/bin/bash
apply=n
read -p "Apply? (y/N): " apply

# terraform init

if [ $apply == "y" ]; then 
    terraform apply -var-file="/Users/janis/.terraform/vars.tfvars" -auto-approve
else 
    terraform plan -var-file="/Users/janis/.terraform/vars.tfvars"
fi

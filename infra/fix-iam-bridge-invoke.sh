#!/bin/bash
# IAM FIX: Grant mcp-bridge-invoke-handler full Lambda invoke access
# Run once from AWS CLI with admin rights
# Unblocks: troy-sql-executor + ~60 other Lambdas via bridge

ROLE="lambda-ses-execution"
POLICY_NAME="bridge-lambda-invoke-all"

echo "Adding Lambda invoke policy to $ROLE..."

aws iam put-role-policy \
  --role-name "$ROLE" \
  --policy-name "$POLICY_NAME" \
  --policy-document '{"Version":"2012-10-17","Statement":[{"Effect":"Allow","Action":["lambda:InvokeFunction","lambda:InvokeAsync"],"Resource":"arn:aws:lambda:ap-southeast-2:140548542136:function:*"}]}'

echo "Done. Test: aws lambda invoke --function-name troy-sql-executor --payload '{}' /tmp/out.json --region ap-southeast-2"

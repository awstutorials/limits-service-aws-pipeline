#!/bin/sh

AZ=`curl -s --connect-timeout 1 http://169.254.169.254/latest/meta-data/placement/availability-zone`
if [ ! -z "$AZ" ]; then
	AWS_REGION=${AZ%?}
else
	echo "[WARNING] No region could be detected, not running on AWS or hosed networking?"
fi

export ENV_DB_PASSWORD=$(aws ssm get-parameter --region ${AWS_REGION} --name ${ENV_DB_PASSWORD_PARAM_NAME} --with-decryption | jq -r .Parameter.Value)
export ENV_USERPOOL_ID=$(aws ssm get-parameter --region ${AWS_REGION} --name ${ENV_USERPOOL_PARAM_NAME} | jq -r .Parameter.Value)

java -jar application.jar
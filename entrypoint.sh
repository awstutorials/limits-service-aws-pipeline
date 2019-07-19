#!/bin/sh

echo 'helloworld...'
echo '*************'
export MINIMUM=$(aws ssm get-parameter --region eu-west-1 --name ${MINIMUM_PARAM_NAME} | jq -r .Parameter.Value)
export MAXIMUM=$(aws ssm get-parameter --region eu-west-1 --name ${MAXIMUM_PARAM_NAME} | jq -r .Parameter.Value)

echo $MINIMUM
echo $MAXIMUM
echo '*************'

java -jar application.jar
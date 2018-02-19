#!/bin/bash

echo Post Install Script

apt-get install -y jq curl

echo Get temporary credentials from AWS IoT:

PRIVATE_KEY = `cat /greengrass/config/config.json | jq -r '.coreThing.keyPath'`
CERTIFICATE = `cat /greengrass/config/config.json | jq -r '.coreThing.certPath'`
ROOT_CA = `cat /greengrass/config/config.json | jq -r '.coreThing.certPath'`
AWS_REGION = `cat /greengrass/config/config.json | jq -r '.coreThing.ggHost | split(".")[2]'`
CREDS = `curl --key /greengrass/certs/$PRIVATE_KEY --cacert /greengrass/certs/$ROOT_CA --cert /greengrass/certs/$CERTIFICATE https://$IOT_CREDENTIAL_ENDPOINT:443/role-aliases/lambda-full-access/credentials`
AWS_ACCESS_KEY_ID = `echo $CREDS | jq -r ".credentials.accessKeyId"`
AWS_SECRET_ACCESS_KEY = `echo $CREDS | jq -r ".credentials.secretAccessKey"`
AWS_SESSION_TOKEN = `echo $CREDS | jq -r ".credentials.sessionToken"`
echo $IOT_CREDENTIAL_ENDPOINT
echo $IOT_GG_GROUP_NAME
echo $AWS_ACCESS_KEY_ID, $AWS_SECRET_ACCESS_KEY, $AWS_SESSION_TOKEN

	# $(eval PRIVATE_KEY = $(shell cat /greengrass/config/config.json | jq -r '.coreThing.keyPath'))
	# $(eval CERTIFICATE = $(shell cat /greengrass/config/config.json | jq -r '.coreThing.certPath'))
	# $(eval ROOT_CA = $(shell cat /greengrass/config/config.json | jq -r '.coreThing.caPath'))
	# $(eval AWS_REGION = $(shell cat /greengrass/config/config.json | jq -r '.coreThing.ggHost | split(".")[2]'))
	# $(eval CREDS = $(shell curl --key /greengrass/certs/$(PRIVATE_KEY) --cacert /greengrass/certs/$(ROOT_CA) --cert /greengrass/certs/$(CERTIFICATE) https://$(IOT_CREDENTIAL_ENDPOINT):443/role-aliases/lambda-full-access/credentials))
	# $(eval AWS_ACCESS_KEY_ID = $(shell echo $(CREDS) | jq -r ".credentials.accessKeyId"))
	# $(eval AWS_SECRET_ACCESS_KEY = $(shell echo $(CREDS) | jq -r ".credentials.secretAccessKey"))
	# $(eval AWS_SESSION_TOKEN = $(shell echo $(CREDS) | jq -r ".credentials.sessionToken"))
	# echo $(IOT_CREDENTIAL_ENDPOINT)
	# echo $(IOT_GG_GROUP_NAME)
	# echo $(CREDS)

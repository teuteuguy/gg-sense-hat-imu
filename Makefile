
all: build deploy

build:
	# npm install --unsafe-perm
	apt-get install -y curl
	# echo $(IOT_CREDENTIAL_ENDPOINT)
	# echo $(IOT_GG_GROUP_NAME)
	CREDS := $(shell curl --key /greengrass/certs/*private.* --cacert /greengrass/certs/*root*.* --cert /greengrass/certs/*cert.* https://$(IOT_CREDENTIAL_ENDPOINT):443/role-aliases/lambda-full-access/credentials)
	echo $(CREDS)

deploy: all
	echo "WIP"



all: build deploy

build:
	# npm install --unsafe-perm
	echo $(IOT_CREDENTIAL_ENDPOINT)
	echo $(IOT_GG_GROUP_NAME)

deploy: all
	echo "WIP"


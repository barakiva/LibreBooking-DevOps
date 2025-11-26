# !/usr/bin/env bash
# Set the release version
LB_RELEASE=develop
if [ "${LB_RELEASE}" == "develop" ]; then
  APP_GH_REF="refs/heads/${LB_RELEASE}"
else
  APP_GH_REF="refs/tags/${LB_RELEASE}"
fi
# Build the docker image
docker buildx build \
  --build-arg APP_GH_REF=${APP_GH_REF} \
  --tag librebooking/librebooking:$(echo ${LB_RELEASE} | sed -e "s/^v//") \
  --output type=docker \
  .
```
# Run the docker container
docker run -d -p 8080:80 --name librebooking librebooking/libre
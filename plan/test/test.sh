#!/bin/bash
BUILD=$(uuidgen | tr "[:upper:]" "[:lower:]")
docker build -t ${BUILD} ..
docker run -it \
  -v ${TF_ROOT_DIR}:/github/workspace\
  -v $(pwd)/artifacts/${BUILD}:/github/workspace/artifacts\
  -v $(pwd)/event.json:/github/workspace/event.json\
  --workdir=/github/workspace\
  --env-file=test.env\
  ${BUILD}
docker rmi ${BUILD}

#!/bin/bash
BUILD=$(uuidgen | tr "[:upper:]" "[:lower:]")

if [ -z ${TF_ROOT_DIR} ]; then
  TF_ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"/fixture
fi

INPUT_CMD=${1}
case $INPUT_CMD in
"plan")
  rm -rf $(pwd)/artifacts/*
  ;;
"apply")
  ;;
"test")
  ;;
"diff")
  ;;
*)
  echo "Unknown command ${INPUT_CMD}"
  exit 2
  ;;
esac

docker build -t ${BUILD} ..
docker run -it \
  -v ${TF_ROOT_DIR}:/github/workspace\
  -v $(pwd)/artifacts:/github/workspace/artifacts\
  -v $(pwd)/event.json:/github/workspace/event.json\
  --workdir=/github/workspace\
  --env-file=test.env\
  -e TERRAFORM_TOKEN=${TERRAFORM_TOKEN}\
  -e SSH_PRIV_KEY_B64=${SSH_PRIV_KEY_B64}\
  -e GITHUB_TOKEN=${GITHUB_TOKEN}\
  -e INPUT_CMD=${INPUT_CMD}\
  -e DRYRUN=false\
  ${BUILD}

if [ ! -z ${KEEP_IMAGE} ]; then
  docker rmi ${BUILD}
fi
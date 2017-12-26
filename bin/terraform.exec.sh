#!/bin/bash

ACTION=$1
ENV=$2

log() {
  echo `date '+%Y-%m-%d %H:%M:%S'` $*
}
debug() {
  if [ "${DEBUG}" = 1 ]; then
    log DEUBG $*
  fi
}
error() {
  log ERROR $*
}
info() {
  log INFO $*
}
fail_exit() {
  log ERROR $*
  exit 1
}
arguments () {
  echo "ArgumentsError: Require '$1'"
  echo \
  "
  USAGE
    `basename $0` Env Action

  Arguments
    Action : plan | apply
    Env : ploduction | staging
  "
}

trap "fail_exit "予期せぬエラーが発生しました"" ERR

# 引数チェック
if [ "$ACTION" = '' ]
then
  arguments Action
  exit 1
fi

if [ "$ENV" = '' ]
then
  arguments Env
  exit 1
fi

TFSTATE_FILE="${ENV}.tfstate"}}
AWS_REGION=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone | sed -e s/[^0-9]$//g`]
source ../environments/${ENV}/config/${ENV}.conf

terraform init \
  -backend=true \
  -backend-config="bucket=${S3_BUCKET_NAME}" \
  -backend-config="key=${TFSTATE_FILE}" \
  -backend-config="region=${AWS_REGION}"}}}

terraform ${ACTION} \
  -state=${TFSTATE_FILE} \
  -refresh=true \
  -var-file=../tfvars/common.tfvars \
  -var-file=../environments/${ENV}/tfvars/${ENV}.tfvars \
  -var-file=../environments/${ENV}/tfvars/credential.tfvars
# 後始末
if [ "$ACTION" != "plan" ]
then
  rm -f ${TFSTATE_FILE}.backup
fi

echo "DONE!"

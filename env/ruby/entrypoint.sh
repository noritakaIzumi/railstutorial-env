#!/usr/bin/env bash

APP_NAME=$1

pushd /repo/app/"${APP_NAME}" || exit 1
bundle install
find tmp/pids -type f -name '*.pid' -exec rm -v {} \;
rails server --environment="${RAILS_ENV}" --binding=0.0.0.0 --port="${CONTAINER_PORT}"

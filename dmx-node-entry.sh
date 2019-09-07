#!/bin/sh

set -x
set -e

if [ -z "${GITHUB_TOKEN}" ]; then
  echo "You have to specify the -e GITHUB_TOKEN=... argument"
  exit 1
fi
if [ -z "${SECRET}" ]; then
  echo "You have to specify the -e SECRET=... argument"
  exit 2
fi

if [ -d 0dmx ]; then
  cd 0dmx
  git clean -fd
  git reset --hard
  git pull
else
  git clone "https://yegor256:${GITHUB_TOKEN}@github.com/yegor256/0dmx"
  cd 0dmx
fi

bundle update --no-color

bundle exec ruby bin/brigade "--secret=${SECRET}" "${ARGS}"

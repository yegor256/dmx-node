#!/bin/sh

set -x
set -e

if [ -z "${GITHUB_TOKEN}" ]; then
  echo "You have to specify the -e GITHUB_TOKEN=... argument"
  exit
fi
if [ -z "${SECRET}" ]; then
  echo "You have to specify the -e GITHUB_TOKEN=... argument"
  exit
fi

if [ -d 0dmx ]; then
  cd 0dmx
  git pull
  cd ..
else
  git clone "https://yegor256:${GITHUB_TOKEN}@github.com/yegor256/0dmx"
fi

./0dmx/bin/brigade "--secret=${SECRET}"

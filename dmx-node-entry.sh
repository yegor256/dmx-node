#!/bin/sh

# The MIT License (MIT)
#
# Copyright (c) 2019 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

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

# Start Sendmail service in order to have an ability to
# send email from the running container.
/etc/init.d/sendmail start

if [ -d 0dmx ]; then
  cd 0dmx
  git clean -fd
  git reset --hard
else
  git clone "https://yegor256:${GITHUB_TOKEN}@github.com/yegor256/0dmx"
  cd 0dmx
fi
git checkout master
git pull --tags
tag=$(git describe --tags $(git rev-list --tags --max-count=1))
git checkout "${tag}"

bundle update --no-color

bundle exec ruby bin/brigade "--secret=${SECRET}" "${ARGS}"

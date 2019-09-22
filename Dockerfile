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

FROM ubuntu:18.04
MAINTAINER Yegor Bugayenko <yegor256@gmail.com>
LABEL Description="To run a DMX node (private use only)" Vendor="Yegor Bugayenko" Version="0.1"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:brightbox/ruby-ng
RUN apt-get update --fix-missing
RUN apt-get upgrade -y
RUN apt-get install -y sqlite3
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y nodejs
RUN apt-get install -y lsof
RUN apt-get install -y vim
RUN apt-get update --fix-missing
RUN apt-get install -y imagemagick
RUN apt-get install -y ruby2.6 ruby2.6-dev
RUN apt-get install -y zlib1g-dev libssl-dev make build-essential libcurl4-openssl-dev
RUN apt-get install -y iputils-ping
RUN apt-get install -y git-core
RUN apt-get install -y psmisc
RUN apt-get install -y sudo

RUN apt-get install -y firefox libcairo2 libcairo-gobject2 libxt6 libsm6 libice6 libgtk-3-0

RUN FF_VERSION=68.0.2 && \
  wget http://ftp.mozilla.org/pub/firefox/releases/${FF_VERSION}/linux-$(uname -m)/en-US/firefox-${FF_VERSION}.tar.bz2 && \
  tar -xjf firefox-${FF_VERSION}.tar.bz2 && \
  rm -f firefox-${FF_VERSION}.tar.bz2 && \
  mv firefox /opt/ && \
  rm -f /usr/bin/firefox && \
  ln -s /opt/firefox/firefox /usr/bin/firefox && \
  apt-mark hold firefox

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4 && \
  echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.0 multiverse" | tee /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org

RUN GECKO_VERSION=0.25.0 && \
  wget https://github.com/mozilla/geckodriver/releases/download/v${GECKO_VERSION}/geckodriver-v${GECKO_VERSION}-linux64.tar.gz && \
  tar -xvzf geckodriver* && \
  rm geckodriver*.tar.gz && \
  chmod a+x geckodriver && \
  mv "$(pwd)/geckodriver" /usr/local/bin

RUN apt-get install -y sendmail mailutils

RUN apt-get clean

RUN gem install bundler

COPY dmx-node-entry.sh /
RUN chmod a+x /dmx-node-entry.sh

ENTRYPOINT ["/dmx-node-entry.sh"]

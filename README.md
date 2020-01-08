[![Build Status](https://img.shields.io/travis/yegor256/dmx-node/master.svg)](https://travis-ci.org/yegor256/dmx-node)
[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/yegor256/dmx-node)](https://hub.docker.com/r/yegor256/dmx-node)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/dmx-node/master/LICENSE.txt)

This [Docker](https://www.docker.com/) image helps you start a new DMX node.

First, you [pull it](https://hub.docker.com/r/yegor256/dmx-node):

```bash
$ docker pull yegor256/dmx-node
```

It is recommended to use a specific version, though, like this one:

```bash
$ docker pull yegor256/dmx-node:0.5
```

Then, you run it:

```
$ docker run -d --name=dmx --restart=always -e GITHUB_TOKEN=... -e ARGS=... yegor256/dmx-node:0.5
```

The GitHub token you have to get [here](https://github.com/settings/tokens).

The Secret you have to get in the `config.yml` file injected into 0dmx during deployment.

Here is how you [install](https://docs.docker.com/install/) Docker.
This [manual](https://linuxconfig.org/how-to-install-docker-on-ubuntu-18-04-bionic-beaver) is the simplest.

Additional params can be sent via `-e ARGS=...` argument. For example:

```
$ docker run "ARGS=--threads=1" ...
```

If you want to run it in an interactive mode, do it this way:

```
$ docker run -it --rm --entrypoint= yegor256/dmx-node:0.5 /bin/bash
```

## How to contribute?

First, fork the repo, make a branch, and make necessary changes to the files.
Then, build the Docker image locally:

```
$ docker image build .
```

Then, if everything works, push the change to the branch and send a pull request.

Everything that is merged into `master` is picked up by
[Docker Hub](https://hub.docker.com/r/yegor256/dmx-node) automatically. Once
you see a new green build there, you may want to create a new tag, to
stabilize the version (replace the `2f1e65b6980e` with the ID of the
image in its latest version and `0.1` with the actual tag name):

```
$ docker images
$ docker tag 2f1e65b6980e yegor256/dmx-node:0.5
```

And then, push the tag to the repo:

```
$ docker login
$ docker push yegor256/dmx-node:0.5
```

Would be great to automate this via Rultor, BTW...

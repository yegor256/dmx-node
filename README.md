[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/yegor256/dmx-node)](https://cloud.docker.com/repository/docker/yegor256/dmx-node/builds)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/dmx-node/master/LICENSE.txt)

This [Docker](https://www.docker.com/) image helps you start a new DMX node.

First, you [pull it](https://cloud.docker.com/repository/docker/yegor256/dmx-node):

```bash
$ docker pull yegor256/dmx-node
```

Then, you run it:

```
$ docker run -d --name=dmx --restart=always -e GITHUB_TOKEN=... -e SECRET=... yegor256/dmx-node
```

The GitHub token you have to get [here](https://github.com/settings/tokens).

The Secret you have to get in the `config.yml` file injected into 0dmx during deployment.

Here is how you [install](https://docs.docker.com/install/) Docker.
This [manual](https://linuxconfig.org/how-to-install-docker-on-ubuntu-18-04-bionic-beaver) is the simplest.

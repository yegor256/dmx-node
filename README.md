[![Docker Cloud Automated build](https://img.shields.io/docker/cloud/automated/yegor256/dmx-node)](https://cloud.docker.com/repository/docker/yegor256/dmx-node/builds)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/yegor256/dmx-node/master/LICENSE.txt)

This [Docker](https://www.docker.com/)
image helps you start a new DMX node.

First, you [pull it](https://cloud.docker.com/repository/docker/yegor256/dmx-node):

```bash
$ docker pull yegor256/dmx-node
```

Then, you run it:

```
$ docker run --name dmx --restart=always \
  -e GITHUB_TOKEN=... -e SECRET=... \
  yegor256/dmx-node
```

Here is how you [install](https://docs.docker.com/install/) Docker.

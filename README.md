ergw-capwap-node
===============

[![Build Status](https://travis-ci.org/travelping/ergw-capwap-node.svg?branch=master)](https://travis-ci.org/travelping/ergw-capwap-node)

OTP application to package a erGW CAPWAP Control Node.

Installing on Ubuntu 16.04
--------------------------

Package for Ubuntu 16.04 are build on every commit to this repository and uploaded to bintray. In order to install them do this:

    sudo echo "deb http://ppa.launchpad.net/ergw/xenial/ubuntu xenial main" > /etc/apt/sources.list.d/ergw-xenial-ppa.list
    sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 58A14C3D
    curl -s https://packagecloud.io/install/repositories/ergw/ci/script.deb.sh | sudo bash
    apt-get -y install ergw-capwap-node

After installation adjust /etc/ergw-capwap-node/ergw-capwap-node.config

Build
-----

    $ rebar3 compile

Docker container images
-----------------------

This repository also creates a [Docker
image](https://hub.docker.com/r/ergw/ergw-capwap-node/). At the time of writing we
recommend to use this base image for testing and development. You can use the
host network and need network interfaces to be configured beforehand.

To add a custom configuration to the container, a volume may be mounted
to `/config/ergw-capwap-node` containing the `sys.config` and `vm.args` erlang
config. Alternatively, you may use a volume to provide the configuration in
`/etc/erlang-capwap-node/erlang-capwap-node.config` or alter this file in
a running container.

You can build the Docker image manually by executing the following command
line: It makes use of a feature in Docker called "multi stage" builds and
needs at least Docker-17.05. Build the image like this:

    $ docker build -f docker/Dockerfile -t ergw-capwap-node:alpine .


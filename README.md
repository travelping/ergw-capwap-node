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

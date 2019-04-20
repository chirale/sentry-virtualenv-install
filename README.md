# sentry-virtualenv-install
Blatantly ignore deprecation in favor of docker and use the simpler virtualenv to run Sentry as of https://docs.sentry.io/server/installation/python/.

Install script tested on Ubuntu 18.04 for debian-based systems.

## Usage
~~~
cd /path/to/venvs/root;
install-sentry.sh myenvname
source myenvname/bin/activate
~~~

A new directory containing the sentry virtualenv will be created.
- user must be sudo
- dependencies will be auto-installed
- virtualenv will be installed along with pip3 (virtualenv will run on Python 3 to be future-proof)
- you can specify a directory you haven't access to and it will be automatically (cho)wned to you

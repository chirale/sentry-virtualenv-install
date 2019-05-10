# sentry-virtualenv-install
Blatantly ignore deprecation in favor of docker and use the simpler virtualenv to run Sentry as of https://docs.sentry.io/server/installation/python/.

Install script tested on Ubuntu 18.04 for debian-based systems.

## Usage
~~~
cd /path/to/venvs/root;
install-sentry.sh myenvname
source myenvname/bin/activate
~~~

A new directory containing the sentry virtualenv will be created, all dependencies will be installed on the system and on virtualenv. All python 2 packages will be installed inside the virtualenv.

- user must be sudo
- dependencies will be auto-installed
- virtualenv will be installed along with pip3 (virtualenv will run on Python 3 to be future-proof)
- you can specify a directory you haven't access to and the created directory will be automatically (cho)wned to you


## Next

After these steps, sentry can be installed as of https://docs.sentry.io/server/installation/python/#initializing-the-configuration:

1. Creating a new directory (e.g. /path/to/new/config/directory)
2. Activating the virtualenv with `source /path/to/sentry/venv`
3. Doing `sentry init /path/to/new/config/directory`
4. Editing the .py and .yml file with connection data for database

E.g.
- virtualenv in /usr/local/venv/sentry
- sentry conf in /usr/local/etc/sentry

# sentry-virtualenv-install
Blatantly ignore deprecation in favor of docker and use the simpler virtualenv to run Sentry as of https://docs.sentry.io/server/installation/python/.

Install script tested on Ubuntu 18.04 for debian-based systems.

## New Sentry installation
### Install last available sentry
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


### Initialize

After these steps, sentry can be installed as of https://docs.sentry.io/server/installation/python/#initializing-the-configuration:

1. Creating a new directory (e.g. /path/to/new/config/directory)
2. Activating the virtualenv with `source /path/to/sentry/venv`
3. Doing `sentry init /path/to/new/config/directory`
4. Create the database
5. Editing the .py and .yml file with connection data for database
6. Migrate https://docs.sentry.io/server/installation/python/#running-migrations


#### Path example
- virtualenv in /usr/local/venv/sentry
- sentry conf in /usr/local/etc/sentry

## Existing Sentry installation

If the virtualenv is broken, it can be recreated

### Recreate virtualenv on system upgrade

When system libraries are upgraded there could be errors running the existing virtualenv. Check install-sentry-912.sh for a custom case to deploy a new virtualenv for an existing Sentry installation, then simply source bin/activate the new virtualenv on start scripts after stopping the old one.

#!/bin/bash
VENVNAME=$1
# stop at line on error
set -e
WHO=`whoami`
# install dependencies
sudo apt-get install python-setuptools python-dev libxslt1-dev gcc libffi-dev libjpeg-dev libxml2-dev libxslt-dev libyaml-dev libpq-dev
# install virtualenv for pip3
read -p "Will install Sentry on: ${VENVNAME}. Continue? y [n]" -n 1 -r
echo    # (optional) move to a new line
# @see https://stackoverflow.com/a/1885534
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && echo "User quit" && exit 1 || return 1 # handle exits from shell or function but don't exit interactive shell
fi
# create directory in any path, and assign to current user
sudo mkdir -p ${VENVNAME}
sudo chown ${WHO}:${WHO} ${VENVNAME}
# use virtualenv for Python 3
sudo apt-get install python3-pip -y && pip3 install virtualenv
# create virtualenv
virtualenv --python /usr/bin/python2.7 ${VENVNAME}
# activate sentry
source ${VENVNAME}/bin/activate
# upgrade pip
pip install --upgrade pip
# install sentry
pip install sentry
# deactivate virtualenv
deactivate
# to use:
# source VENVNAME_HERE/bin/activate
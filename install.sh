#!/usr/bin/env bash

pushd "$(pwd)" || exit

BIN_DIR="$HOME/.local/bin"
INSTALL_TMP="/tmp/notebook-setup"

echo 'Installing gitconfig'
wget -O "${HOME}/.gitconfig" https://raw.githubusercontent.com/cfchase/notebook-setup/master/.gitconfig &> /dev/null

echo 'Installing cookiecutter package'
pip install cookiecutter &> /dev/null

echo 'Installing GitHub client'
mkdir -p "${INSTALL_TMP}"
cd "${INSTALL_TMP}" || exit
wget https://github.com/cli/cli/releases/download/v1.8.1/gh_1.8.1_linux_amd64.tar.gz &> /dev/null
tar -xvf gh_1.8.1_linux_amd64.tar.gz &> /dev/null
mv gh_1.8.1_linux_amd64/bin/gh ${BIN_DIR} &> /dev/null

echo 'Installing OpenShift CLI (oc)'
mkdir -p "${INSTALL_TMP}"
cd "${INSTALL_TMP}" || exit
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz &> /dev/null
tar -xvf openshift-client-linux.tar.gz &> /dev/null
mv oc /opt/app-root/bin/oc &> /dev/null


echo 'Cleaning up'
rm -rf "${INSTALL_TMP}"

popd || exit
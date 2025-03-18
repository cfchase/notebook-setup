#!/usr/bin/env bash

pushd "$(pwd)" || exit

BIN_DIR="$HOME/.local/bin"
INSTALL_TMP="/tmp/notebook-setup"

echo 'Installing gitconfig'
wget -O "${HOME}/.gitconfig" https://raw.githubusercontent.com/cfchase/notebook-setup/master/.gitconfig

echo 'Installing GitHub client'
mkdir -p "${INSTALL_TMP}"
mkdir -p "${BIN_DIR}/"
cd "${INSTALL_TMP}" || exit
GH_VERSION='2.68.1'
wget "https://github.com/cli/cli/releases/download/v${GH_VERSION}/gh_${GH_VERSION}_linux_amd64.tar.gz"
tar -xvf "gh_${GH_VERSION}_linux_amd64.tar.gz"
mv "gh_${GH_VERSION}_linux_amd64/bin/gh" ${BIN_DIR}

echo 'Installing OpenShift CLI (oc)'
mkdir -p "${INSTALL_TMP}"
cd "${INSTALL_TMP}" || exit
wget https://mirror.openshift.com/pub/openshift-v4/clients/ocp/latest/openshift-client-linux.tar.gz
tar -xvf openshift-client-linux.tar.gz
mv oc /opt/app-root/bin/oc


echo 'Cleaning up'
rm -rf "${INSTALL_TMP}"

popd || exit

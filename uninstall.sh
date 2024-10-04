#!/usr/bin/env bash

pushd "$(pwd)" || exit

ODH_DIR="$HOME/.local/bin"

echo 'Uninstalling odh client'
rm "${ODH_DIR}/odh"

echo 'Uninstalling GitHub client'
rm "${ODH_DIR}/gh"

popd || exit

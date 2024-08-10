#!/usr/bin/env bash

## This script is useful for local testing and development.

if ! command -v jq &> /dev/null; then
    echo "jq is required to parse JSON responses. Please install it."
    exit 1
fi

if ! command -v curl &> /dev/null; then
    echo "curl is required to download the latest release. Please install it."
    exit 1
fi

TAG="$(curl https://api.github.com/repos/tagspaces/tagspaces/releases/latest -s | jq .name -r)"
URL="https://github.com/tagspaces/tagspaces/releases/download/$TAG/tagspaces-web-${TAG#v}.zip"

curl -sSLo tagspaces-web.zip "$URL"
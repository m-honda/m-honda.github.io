#!/bin/bash

set -eu

. /etc/os-release
curl -fsSL https://m-honda.github.io/setup/${VERSION_CODENAME}.sh

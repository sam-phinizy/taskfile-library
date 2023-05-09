#!/bin/bash

# We don't need return codes for "$(command)", only stdout is needed.
# Allow `[[ -n "$(command)" ]]`, `func "$(command)"`, pipes, etc.
# shellcheck disable=SC2312

set -u

abort() {
  printf "%s\n" "$@" >&2
  exit 1
}

if ! command -v brew --version &> /dev/null
then
  brew install go-task
fi

mkdir -p ~/.task-utils

curl https://raw.githubusercontent.com/sam-phinizy/recipes/main/taskfile/install-utils.yml -o ~/.task-utils/install-utils.yml

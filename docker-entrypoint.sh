#!/bin/sh
set -e

CMD="$1"
IGNORE_EXTEND="$2"

if [[ ${CMD:0:4} = "http" ]]; then
  GIT_SRC=$1
  CMD="flake8"
fi

if [[ ${CMD:0:3} = "git" ]]; then
  GIT_SRC=$1
  CMD="flake8"
fi

if [ ! -z "$GIT_SRC" ]; then
  cd /code
  git clone $GIT_SRC
  if [ ! -z "$GIT_NAME" ]; then
     if [ -z "$GIT_BRANCH" ]; then
       GIT_BRANCH="master"
     fi
     cd $GIT_NAME
     if [ ! -z "$GIT_CHANGE_ID" ]; then
        GIT_BRANCH=PR-${GIT_CHANGE_ID}
        git fetch origin pull/$GIT_CHANGE_ID/head:$GIT_BRANCH
     fi
     git checkout $GIT_BRANCH
     cd /code
  fi
fi

if [ "$CMD" = "flake8" ]; then
  find -L /code $CUSTOM_FIND -name [eE]xtensions -prune -o -name skins -prune -o -name "*.py" -print | xargs -r flake8 $IGNORE_EXTEND
else
  exec "$@"
fi

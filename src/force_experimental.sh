#!/bin/bash

if test "${1:-}" = "DEBUG"; then
    DEBUG=1
else
    DEBUG=0
fi
if test "${2:-}" != ""; then
    RESOURCES=$2
else
    RESOURCES=~/tmp/resources
fi
ORG=metwork-framework

if test "${2:-}" = ""; then
    echo "Cloning resources repository..."
    rm -Rf ~/tmp/resources
    mkdir -p ~/tmp
    cd ~/tmp || exit 1
    git clone -b experimental "https://github.com/${ORG}/resources.git"
fi

for I in 1 2 3 4 5; do
  echo "**********************************"
  echo "***** INTEGRATION LEVEL ${I} *****"
  echo "**********************************"
  echo
  REPOS=$(metwork_repos.py --minimal-level ${I} --exact-level)
  for REPO in ${REPOS}; do
      echo "=> Working on repo: ${REPO}..."
      if test $I -ge 4; then
          if test $DEBUG -eq 1; then
              _force.sh "${REPO}" experimental "${I}" DEBUG ${RESOURCES}
          else
              _force.sh "${REPO}" experimental "${I}"
          fi
      fi
  done
done

if test "${2:-}" = ""; then
    rm -Rf ~/tmp/resources
fi

#!/bin/bash

if test "${1:-}" = "DEBUG"; then
    DEBUG=1
else
    DEBUG=0
fi
ORG=metwork-framework

echo "Cloning resources repository..."
rm -Rf ~/tmp/resources
cd ~/tmp
git clone "git@github.com:${ORG}/resources"

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
              _force.sh "${REPO}" integration "${I}" DEBUG
          else
              _force.sh "${REPO}" integration "${I}"
          fi
      else
          if test ${DEBUG} -eq 1; then
             _force.sh "${REPO}" master "${I}" DEBUG
          else
             _force.sh "${REPO}" master "${I}"
          fi
      fi
  done
done

rm -Rf ~/tmp/resources

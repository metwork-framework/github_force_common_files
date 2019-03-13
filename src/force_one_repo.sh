#!/bin/bash

ORG=metwork-framework
if test "${1:-}" = ""; then
    echo "force_one_repo.sh REPO-NAME [DEBUG] [RESOURCES_DIR]"
    exit 1
fi
if test "${2:-}" = "DEBUG"; then
    DEBUG=1
else
    DEBUG=0
fi
if test "${3:-}" != ""; then
    RESOURCES=$3
else
    RESOURCES=~/tmp/resources
fi

if test "${3:-}" = ""; then
    echo "Cloning resources repository..."
    rm -Rf ~/tmp/resources
    mkdir -p ~/tmp
    cd ~/tmp || exit 1
    git clone "https://github.com/${ORG}/resources.git"
fi

ORG=metwork-framework
REPO=$1
INTEGRATION_LEVEL=`metwork_topics.py $ORG $REPO| grep "integration-level" | cut -d "-" -f 3`

echo "=> Working on repo: ${REPO}..."
if test $INTEGRATION_LEVEL -ge 4; then
    if test $DEBUG -eq 1; then
        _force.sh "${REPO}" integration "${INTEGRATION_LEVEL}" DEBUG ${RESOURCES}
    else
        _force.sh "${REPO}" integration "${INTEGRATION_LEVEL}"
    fi
else
    if test ${DEBUG} -eq 1; then
       _force.sh "${REPO}" master "${INTEGRATION_LEVEL}" DEBUG ${RESOURCES}
    else
       _force.sh "${REPO}" master "${INTEGRATION_LEVEL}"
    fi
fi

if test "${3:-}" = ""; then
    rm -Rf ~/tmp/resources
fi

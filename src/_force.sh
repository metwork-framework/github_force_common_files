#!/bin/bash

set -e

ORG=metwork-framework
if test "${3:-}" = ""; then
    echo "_force.sh REPO-NAME BRANCH INTEGRATION_LEVEL [DEBUG] [RESOURCES_DIR]"
    exit 1
fi
if test "${4:-}" = "DEBUG"; then
    DEBUG=1
else
    DEBUG=0
fi
if test "${5:-}" = ""; then
    RESOURCES_DIR=~/tmp/resources
else
    RESOURCES_DIR="$5"
fi

if ! test -d ${RESOURCES_DIR}; then
    echo "${RESOURCES_DIR} does not exist"
    exit 1
fi

REPONAME=$1
BRANCH=$2
INTEGRATION_LEVEL=$3
if test "${MFSERV_CURRENT_PLUGIN_NAME:-}" = ""; then
    echo "ERROR: load the plugin environnement before"
    exit 1
fi

cat >~/tmp/force.yaml <<EOF
default_context:
    repo: "${REPONAME}"
    integration_level: "${INTEGRATION_LEVEL}"
EOF

TMPREPO=${TMPDIR:-/tmp}/force_$$

rm -Rf "${TMPREPO}"
mkdir -p "${TMPREPO}"
cd "${TMPREPO}"
git clone "git@github.com:${ORG}/${REPONAME}"

cd "${REPONAME}"
git checkout -b common_files_force --track "origin/${BRANCH}"
REPO_TOPICS=$(metwork_topics.py --json "${ORG}" "${REPONAME}")
export REPO_TOPICS
export REPO_HOME="${TMPREPO}/${REPONAME}"
cookiecutter --no-input --config-file ~/tmp/force.yaml ${RESOURCES_DIR}/cookiecutter
cp -Rf _${REPONAME}/* . |true
cp -Rf _${REPONAME}/.* . 2>/dev/null | true
rm -Rf "_${REPONAME}"
git add --all
N=$(git diff --cached |wc -l)
if test "${N}" -gt 0; then
    if test ${DEBUG} -eq 1; then
        echo "***** DEBUG *****"
        echo "***** DIFF FOR REPO ${REPONAME} (BRANCH: ${BRANCH}, INTEGRATION_LEVEL: ${INTEGRATION_LEVEL}) *****"
        git status
        git diff --cached
        echo 
        echo
    else
        git commit -m "chore: sync common files from resources repository"
        git push -u origin -f common_files_force
        SHA=$(git rev-parse HEAD)
        metwork_valid_merge_logic_status.py "${REPONAME}" "${SHA}"
        if test "${BRANCH}" = "master"; then
            git checkout master
        else
            git checkout -b "${BRANCH}" --track "origin/${BRANCH}"
        fi
        git merge common_files_force
        git push -u origin "${BRANCH}"
        git push origin --delete common_files_force
    fi
fi

rm -Rf "${TMPREPO}"
echo "DONE"

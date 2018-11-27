## What is it ?

This is a [mfserv](https://github.com/metwork-framework/mfserv) plugin to force common files
for [MetWork Organization](https://github.com/metwork-framework) from [resources](https://github.com/metwork-framework/resources)
repository.

## How to use ?

Deploy it as a mfserv plugin and that's it.

## How to debug ?

- clone this repository inside `mfserv` (don't install it)
- clone somewhere `resources` repository
- do some changes in `cookiecutter` subdir
- inside the `github_force_common_files` directory `plugin_env`, you can use
`_force.sh REPO-NAME BRANCH INTEGRATION_LEVEL DEBUG [RESOURCES_DIR]` to test your changes.

**DO NOT INSTALL THIS PLUGIN ON A DEBUG MACHINE TO AVOID THE CRONTAB TO BE INSTALLED**

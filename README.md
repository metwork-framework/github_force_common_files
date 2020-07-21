# github_force_common_files

[//]: # (automatically generated from https://github.com/metwork-framework/resources/blob/master/cookiecutter/_%7B%7Bcookiecutter.repo%7D%7D/README.md)

**Status (master branch)**




[![Drone CI](http://metwork-framework.org:8000/api/badges/metwork-framework/github_force_common_files/status.svg)](http://metwork-framework.org:8000/metwork-framework/github_force_common_files)
[![Maintenance](https://github.com/metwork-framework/resources/blob/master/badges/maintained.svg)]()


[//]: # (TABLE_OF_CONTENTS_PLACEHOLDER)



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











## Contributing guide

See [CONTRIBUTING.md](CONTRIBUTING.md) file.



## Code of Conduct

See [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md) file.



## Sponsors

*(If you are officially paid to work on MetWork Framework, please contact us to add your company logo here!)*

[![logo](https://raw.githubusercontent.com/metwork-framework/resources/master/sponsors/meteofrance-small.jpeg)](http://www.meteofrance.com)

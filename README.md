# Description

This package installs an OXID Shop in CI to make testing standalone OXID modules repositories easier.

# Usage

Install it via composer:
```
composer require --dev oxid-professional-services/install-oxid-for-module
```

You can then run this command to install an OXID shop and configure it:
```
vendor/bin/install-oxid
```
This will:
1. Install an OXID shop in the ~/OXID directory
1. Fill `config.inc.php` with some parameters
1. Configure the `test_config.yml` to test the module
1. Import the database (& run PE/EE migrations)
1. Install the module to the shop via composer

Environment Variables:

| Variable Name | default | description |
| --- | --- | --- |
| OXID | 6.0 | OXID Version to use, e.g. 6.0, 6.1, 6.2-rc |
| OXID_EDITION | ce | pe and ee are also possible |
| DB_HOST | 127.0.0.1 | |
| DB_NAME | oxid | |
| DB_USER | root | |
| DB_PWD |  | |
| SHOP_URL | http://127.0.0.1 | |
| SHOP_LOG_LEVEL | info | |
| USE_OPTIONAL_PACKAGES | 1 | does not install third-party payment modules and the testing library if set to 0 |


You can see an example here: https://github.com/OXIDprojects/oxid-module-internals/blob/1973b16bbe56f972a4061725ec1ce96d371c1f7f/.travis.yml

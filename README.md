# Description

This package installs an OXID Shop in CI to make testing standalone OXID modules repositories easier.

# Usage

Install it via composer:
```
composer require --dev alfredbez/install-oxid-for-module
```

You can then run this command to install an OXID shop and configure it:
```
vendor/bin/install-oxid
```
This will:
1. Install an OXID shop in the ~/OXID directory, you can specify the version with the environment-parameter `OXID` (default is 6.0)
1. Fill `config.inc.php` with some parameters (db-host: 127.0.0.1, dbname: oxid, user: root, password: <empty>, shop-directories)
1. Configure the `test_config.yml` to test the module
1. Install the module to the shop via composer

You can see an example here: https://github.com/OXIDprojects/oxid-module-internals/blob/master/.travis.yml

#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cp "$DIR"/../bin/copy-composer-contents.php "$DIR"/test-copy-composer-contents/
cd "$DIR"/test-copy-composer-contents/ || exit

bash install-oxid

if ! grep -q preferred-install ~/OXID/composer.json; then
    echo 'expected to see config from shop composer.json'
    exit 1
fi

if ! grep -q '"lock": false' ~/OXID/composer.json; then
    echo 'expected to see config from module composer.json'
    exit 1
fi

if ! grep -q 'https://enterprise-edition.packages.oxid-esales.com/' ~/OXID/composer.json; then
    echo 'expected to see repositories from shop composer.json'
    exit 1
fi

if ! grep -q 'https://my-custom-repo.com' ~/OXID/composer.json; then
    echo 'expected to see repositories from module composer.json'
    exit 1
fi


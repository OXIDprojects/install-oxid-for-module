#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cp "$DIR"/../bin/* "$DIR"/test-composer-name/
cd "$DIR"/test-composer-name/ || exit

output=$(bash install-oxid)
if echo "$output" | grep -q "authorname"; then
    exit 1
fi

if ! echo "$output" | grep -q "installing myvendor/mypackage in"; then
    exit 1
fi


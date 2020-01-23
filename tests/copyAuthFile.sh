#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cp "$DIR"/../bin/* "$DIR"/test-copy-auth-file/
cd "$DIR"/test-copy-auth-file/ || exit

output=$(bash install-oxid)

if ! echo "$output" | grep -q "^copied auth.json to composer home directory"; then
    echo 'auth.json was not copied, but we expected it!'
    exit 1
fi

rm -f auth.json

output=$(bash install-oxid)

if echo "$output" | grep -q "^copied auth.json to composer home directory"; then
    echo 'auth.json was copied, but we did not expect it!'
    exit 1
fi


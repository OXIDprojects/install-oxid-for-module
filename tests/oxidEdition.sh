#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
output=$(OXID_EDITION=De bash "$DIR"/../bin/install-oxid)
exitcode=$?
if ! echo "$output" | grep -q "'de' is not a valid OXID edition"; then
    exit 1
fi

if [ "$exitcode" == '1' ]; then
    exit
fi

exit 1

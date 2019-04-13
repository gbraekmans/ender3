#!/bin/bash

winhome=$(echo "$1" | sed 's|\\|/|g' | sed -r 's/(.)\:/\1/')
githome=$(echo $(dirname $0) | sed 's|\\|/|g' | sed -r 's/(.)\:/\1/')

(
    cd  "/cygdrive/$winhome/appdata/roaming/slic3rpe/"
    cp -Rv filament print printer "/cygdrive/$githome/Slic3r_PE"
)

find "/cygdrive/$githome/Slic3r_PE/printer/" -type f -name "*.ini" -print0 | while IFS= read -r -d '' file; do
    sed -ri 's/(printhost.*) = .*/\1 = /' "$file"
    sed -ri 's/print_host.*/print_host = /' "$file"
done
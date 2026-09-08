#!/bin/bash

# Check arguments
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <input_file> <prefix> <lines_to_skip>"
    exit 1
fi

input_file="$1"
prefix="$2"
skip_lines="$3"

awk -F',' -v OFS=',' -v prefix="$prefix" -v skip="$skip_lines" '
NR <= skip {
    print
    next
}
{
    $2 = prefix $2
    print
}
' "$input_file"

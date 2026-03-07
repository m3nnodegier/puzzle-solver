#!/bin/sh

letters="$1"
must="$2"
minlen="$3"
file="${4:-woorden.txt}"

grep -E "^[${letters}]*${must}[${letters}]*$" "$file" \
| awk -v m="$minlen" 'length>=m' \
| sort -u \
| awk '{print length, $0}' \
| sort -n -k1,1 -k2,2 \
| cut -d" " -f2-

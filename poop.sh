#!/bin/bash -u
shopt -s nullglob
poops=(/tmp/*.poops)
echo "Found ${#poops[@]}"
if [ ${#poops[@]} -gt 0 ]; then
    for poop in "${poops[@]}"; do
        cat /tmp/$poop
    done
fi
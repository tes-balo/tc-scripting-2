#!/usr/bin/env bash


create_projects() {
    # project_name="${1:?project name not specified, exiting....}"
    name_start="Project"
    name_end="RG"

    caps=("A" "B" "C" "D" "E")

    for letter in "${caps[@]}"
    do
    az group create -n "${name_start}-${letter}-${name_end}" \
    -l "southafricanorth" \
    --tags env=dev owner=balogun \
    --output table
    done
}

create_projects

# Please refer to my readme for snapshot of the working script
#!/usr/bin/env bash

create_rgs() {
    project_name="${1:?Project name must be specified. Exiting.....}"
    groups=("Dev" "Test" "UAT" "Production")
    name_end="rg"

    echo "Creating rg's, standby"
    for group in "${groups[@]}"; do
        az group create \
        -n "${project_name}-${group}-${name_end}" \
        -l "southafricanorth" \
        --tags env="${group}" owner=Balogun \
        --output table
    done

    echo "All resource groups have been created successfully."
    echo "Run <az group list> to show a json format list of your rgs"

    # NOTES: Appended RG suffix to resource group names per Azure naming conventions
}


create_rgs "${1}"
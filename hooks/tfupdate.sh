#!/usr/bin/env bash -x

set -euo pipefail

main() {
    local sourceType=$1    # one of [github, gitlab, tfregistryModule, tfregistryProvider]
    local resourceType=$2  # one of [provider, module]
    local resourceName=$3  # resource name, e.g. mrparkers/keycloak
    local resourceAlias=$4 # resource alias in terraform code, e.g. keycloak

    local latest=$(tfupdate release latest --source-type="$sourceType" "$resourceName")

    tfupdate "$resourceType" "$resourceAlias" --version "$latest" --recursive .

    return $?
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi

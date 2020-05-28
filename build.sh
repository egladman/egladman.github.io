#!/bin/bash -e

_build() {
    local source="${1}" # # The template typically ends with *.cw
    local destination="${2}"
    local configuration="${3}"

    if [[ -z "${configuration}" ]]; then
        configuration="crunchwrap.config"
    fi

    # > man bash
    # Each variable or function that is created or modified is given the export
    # attribute and marked for export to the environment of subsequent commands
    set -o allexport # Enable
    source "${configuration}"
    set +o allexport # Disable

    # Write to stdout and destination
    cat "${source}" | cw | tee "${destination}"
}

# When we 'source' our config file we're setting new variables. So as a precaution
# we start in an empty environemnt for we don't have to worry about name collisons
env --ignore-environment "$(_build index.html.cw index.html)"
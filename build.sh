#!/bin/bash -e

readonly build_dir="site"

_build() {
    local source="$1" # # The template typically ends with *.cw
    local destination="$2"
    local configuration="$3"

    if [[ -z "$configuration" ]]; then
        configuration="crunchwrap.conf"
    fi

    # Write to stdout and destination
    cat "$source" | cw -i "$configuration" | tee "$destination"
}

_copy() {
    [[ ! -d "$build_dir" ]] && mkdir "$build_dir"

    cp -r assets "$build_dir"
    cp -r downloads "$build_dir"/downloads
}

main() {
    _copy
    _build index.html.cw ${build_dir}/index.html
}

main

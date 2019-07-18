#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"
declare -r ASDF_DIRECTORY="$HOME/.asdf"
declare -r ASDF_GIT_REPO_URL="https://github.com/asdf-vm/asdf.git"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_asdf_configs() {

    declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# ASDF

export ASDF_DIR=\"$ASDF_DIRECTORY\"

[ -f \"\$ASDF_DIR/asdf.sh\" ] \\
    && . \"\$ASDF_DIR/asdf.sh\"

[ -f \"\$ASDF_DIR/completions/asdf.bash\" ] \\
    && . \"\$ASDF_DIR/completions/asdf.bash\"
"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "ASDF (update $LOCAL_SHELL_CONFIG_FILE)"

}

install_asdf() {

    # Install `asdf` and add the necessary
    # configs in the local shell config file.

    execute \
        "git clone --quiet $ASDF_GIT_REPO_URL $ASDF_DIRECTORY" \
        "ASDF (install)" \
    && add_asdf_configs

}

update_asdf() {

    execute \
        "cd $ASDF_DIRECTORY \
            && git fetch --quiet origin \
            && git checkout --quiet \$(git describe --abbrev=0 --tags) \
            && . $ASDF_DIRECTORY/asdf.sh" \
        "ASDF (upgrade)"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   ASDF\n\n"

    if [ ! -d "$ASDF_DIRECTORY" ]; then
        install_asdf
    else
        update_asdf
    fi

}

main

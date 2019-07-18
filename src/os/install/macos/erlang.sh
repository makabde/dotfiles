#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_or_update_erlang() {

    declare -r PLUGIN_NAME="erlang"
    declare -r PLUGIN_URL="https://github.com/asdf-vm/asdf-erlang.git"

    source "$HOME/.asdf/asdf.sh"

    export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"

    asdf_install_or_update_plugin $PLUGIN_NAME $PLUGIN_URL
    asdf_install_language $PLUGIN_NAME

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   ERLANG\n\n"

    install_or_update_erlang

}

main

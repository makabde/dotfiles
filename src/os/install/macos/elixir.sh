#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_or_update_elixir() {

    declare -r PLUGIN_NAME="elixir"
    declare -r PLUGIN_URL="https://github.com/asdf-vm/asdf-elixir.git"

    source "$HOME/.asdf/asdf.sh"

    asdf_install_or_update_plugin $PLUGIN_NAME $PLUGIN_URL
    asdf_install_language $PLUGIN_NAME
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Elixir\n\n"

    install_or_update_elixir

}

main

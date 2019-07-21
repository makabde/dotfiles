#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugin() {

    declare -r TPM_PATH="$HOME/.tmux/plugins/tpm"
    declare -r TPM_URL="https://github.com/tmux-plugins/tpm"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install or update TPM.

    if [ -e "$TPM_PATH" ]; then
        execute \
            "cd $TPM_PATH && git pull" \
            "Tmux (Update TPM)" \
            || return 1

    else
        execute \
            "git clone $TPM_URL $TPM_PATH" \
            "Tmux (Install TPM)" \
            || return 1
    fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Tmux\n\n"

    "./$(get_os)/tmux.sh"
    install_plugin

}

main

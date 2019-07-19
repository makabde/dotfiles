#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_plugins() {

    declare -r VIM_PLUG_PATH="$HOME/.vim/autoload/plug.vim"
    declare -r VIM_PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    declare -r VIM_BUNDLES_FILE="$HOME/.vimrc.bundles"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install plugins.

    if [ -e "$VIM_PLUG_PATH" ]; then
        vim -E -s +PlugUpgrade +qa
    else
        execute \
            "curl -fLo $VIM_PLUG_PATH --create-dirs $VIM_PLUG_URL" \
            "Vim (Install Plug)" \
            || return 1
    fi

    if [ -e "$VIM_BUNDLES_FILE" ]; then
        execute \
            "vim -u $VIM_BUNDLES_FILE +PlugUpdate +PlugClean! +qa" \
            "Vim (Install Plug plugins)" \
            || return 1
    fi
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n   Vim\n\n"

    "./$(get_os)/vim.sh"
    install_plugins

}

main

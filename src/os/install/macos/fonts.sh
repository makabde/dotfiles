#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Fonts\n\n"

brew_install "Fira-Code" "font-fira-code" "homebrew/cask-fonts" "cask"
brew_install "Hack" "font-hack" "homebrew/cask-fonts" "cask"

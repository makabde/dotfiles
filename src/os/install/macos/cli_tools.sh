#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   CLI Tools\n\n"

brew_install "coreutils" "coreutils"
brew_install "automake" "automake"
brew_install "autoconf" "autoconf"
brew_install "openssl" "openssl"
brew_install "libyaml" "libyaml" # Must come after openssl
brew_install "readline" "readline"
brew_install "libxslt" "libxslt"
brew_install "libtool" "libtool"
brew_install "unixodbc" "unixodbc"
brew_install "unzip" "unzip"
brew_install "curl" "curl"
brew_install "wx" "wxmac"

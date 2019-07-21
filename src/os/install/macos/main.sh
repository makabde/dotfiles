#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./bash.sh

./../asdf.sh
./git.sh
./../nvm.sh
./browsers.sh
./design_tools.sh
./development_tools.sh
./erlang.sh
./elixir.sh
./gpg.sh
./../npm.sh
./quick_look.sh
./../tmux.sh
./../vim.sh
./vpn.sh

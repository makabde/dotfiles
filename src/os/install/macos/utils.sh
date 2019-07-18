#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

asdf_install_language() {

    declare -r LANGUAGE="$1"
    local version

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `ASDF` is installed.

    if ! cmd_exists "asdf"; then
        print_error "$LANGUAGE ('ASDF' is not installed)"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    version="$(asdf list-all "$LANGUAGE" | grep -v "[a-z]" | tail -1)"

    if ! asdf list "$LANGUAGE" | grep -Fq "$version"; then
        execute \
            "asdf install $LANGUAGE $version \
                && asdf global $LANGUAGE $version" \
            "ASDF (Install $LANGUAGE $version)"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

asdf_install_or_update_plugin() {

    declare -r NAME="$1"
    declare -r URL="$2"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `ASDF` is installed.

    if ! cmd_exists "asdf"; then
        print_error "$NAME ('ASDF' is not installed)"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! asdf plugin-list | grep -Fq "$NAME"; then
        execute \
            "asdf plugin-add $NAME $URL" \
            "ASDF (Add plugin $NAME)"
    else
        execute \
            "asdf plugin-update $NAME" \
            "ASDF (Update plugin $NAME)"
    fi

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install() {

    declare -r CMD="$4"
    declare -r CMD_ARGUMENTS="$5"
    declare -r FORMULA="$2"
    declare -r FORMULA_READABLE_NAME="$1"
    declare -r TAP_VALUE="$3"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Homebrew` is installed.

    if ! cmd_exists "brew"; then
        print_error "$FORMULA_READABLE_NAME ('Homebrew' is not installed)"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If `brew tap` needs to be executed,
    # check if it executed correctly.

    if [ -n "$TAP_VALUE" ]; then
        if ! brew_tap "$TAP_VALUE"; then
            print_error "$FORMULA_READABLE_NAME ('brew tap $TAP_VALUE' failed)"
            return 1
        fi
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the specified formula.

    # shellcheck disable=SC2086
    if brew $CMD list "$FORMULA" &> /dev/null; then
        print_success "$FORMULA_READABLE_NAME"
    else
        execute \
            "brew $CMD install $FORMULA $CMD_ARGUMENTS" \
            "$FORMULA_READABLE_NAME"
    fi

}

brew_prefix() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if path="$(brew --prefix 2> /dev/null)"; then
        printf "%s" "$path"
        return 0
    else
        print_error "Homebrew (get prefix)"
        return 1
    fi

}

brew_tap() {
    brew tap "$1" &> /dev/null
}

brew_update() {

    execute \
        "brew update" \
        "Homebrew (update)"

}

brew_upgrade() {

    execute \
        "brew upgrade" \
        "Homebrew (upgrade)"

}

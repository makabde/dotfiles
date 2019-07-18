# [Makabde](https://github.com/makabde)’s dotfiles

These are the base dotfiles that I start with when I set up a
new environment. For more specific local needs I use the `.local`
files described in the [`Local Settings`](#local-settings) section.

This repository is a fork from [Cătălin Mariș](https://github.com/alrra)'s
[dotfiles](https://github.com/alrra/dotfiles). It is customized to meet
my needs & preferences.
Major customization include (but are not limited to):
* Use of [VimPlug](https://github.com/junegunn/vim-plug) instead of
  [minpac](https://github.com/k-takata/minpac).
* Application installed with Homebrew are totally changed
  * Design tools
  * Development tools
  * PGP use [GPG Tools](https://gpgtools.org/) instead of GPG &
    Pinentry-Mac
  * Mackup for synching application preferences via iCloud
  * ~~Removed totally the ubuntu installer as I have no use of Ubuntu in
  my daily practice.~~
  * etc.

## Table of Contents

- [Makabde’s dotfiles](#Makabdes-dotfiles)
  - [Table of Contents](#Table-of-Contents)
  - [Setup](#Setup)
  - [Customize](#Customize)
    - [Local Settings](#Local-Settings)
      - [`~/.bash.local`](#bashlocal)
      - [`~/.gitconfig.local`](#gitconfiglocal)
      - [`~/.vimrc.local`](#vimrclocal)
    - [Forks](#Forks)
  - [Update](#Update)
  - [Screenshots](#Screenshots)
    - [Git](#Git)
    - [tmux & vim](#tmux--vim)
  - [License](#License)

## Setup

To set up the `dotfiles` just run the appropriate snippet in the
terminal:

(:warning: **DO NOT** run the `setup` snippet if you do not fully
understand [what it does][setup]. Seriously, **DON'T**!)

| OS      | Snippet                                                                               |
| :------ | :------------------------------------------------------------------------------------ |
| `macOS` | `bash -c "$(curl -LsS https://raw.github.com/alrra/dotfiles/master/src/os/setup.sh)"` |

That's it! :sparkles:

The setup process will:

* Download the dotfiles on your computer (by default it will
  suggest `~/projects/dotfiles`)
* Create some additional [directories][directories]
* [Symlink][symlink] the
  [`git`](src/git),
  [`shell`](src/shell), and
  [`vim`](src/vim) files
* Install applications / command-line tools for
  [`macOS`](src/os/install/macos) /
* Set custom
  [`macOS`](src/os/preferences/macos) /
* Install [`vim` plugins](src/vim/vim/vimrc.bundles)

Setup process in action:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/19314446/cd89a592-90a2-11e6-948d-9d75247088ba.gif" alt="Setup process on Ubuntu" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
        </td>
    </tbody>
</table>

## Customize

### Local Settings

The `dotfiles` can be easily extended to suit additional local
requirements by using the following files:

#### `~/.bash.local`

The `~/.bash.local` file it will be automatically sourced after
all the other [`bash` related files][shell], thus, allowing
its content to add to or overwrite the existing aliases, settings,
PATH, etc.

Here is a very simple example of a `~/.bash.local` file:

```bash
#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set local aliases.

alias starwars="telnet towel.blinkenlights.nl"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set PATH additions.

PATH="$PATH:$HOME/projects/dotfiles/src/bin"

export PATH

```

#### `~/.gitconfig.local`

The `~/.gitconfig.local` file it will be automatically included
after the configurations from `~/.gitconfig`, thus, allowing its
content to overwrite or add to the existing `git` configurations.

__Note:__ Use `~/.gitconfig.local` to store sensitive information
such as the `git` user credentials, e.g.:

```bash
[commit]

    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/

    gpgsign = true


[user]

    name = Mak Abdennabi
    email = makabde@example.com
    signingkey = XXXXXXXX
```

#### `~/.vimrc.local`

The `~/.vimrc.local` file it will be automatically sourced after
`~/.vimrc`, thus, allowing its content to add or overwrite the
settings from `~/.vimrc`.

### Forks

If you decide to fork this project, do not forget to substitute
my username with your own in the [`setup` snippets](#setup) and
[in the `setup` script][setup line]

## Update

To update the dotfiles you can either run the [`setup` script][setup]
or, if you want to just update one particular part, run the appropriate
[`os` script](src/os).

## Screenshots

### Git

Output for `git status`:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10561038/f9f11a28-7525-11e5-8e1d-a304ad3557f9.png" alt="Output for Git status on macOS" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
        </td>
    </tbody>
</table>

Output for `git log`:

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10560966/e4ec08a6-7523-11e5-8941-4e12f6550a63.png" alt="Output for Git status on macOS" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
        </td>
    </tbody>
</table>

### tmux & vim

<table>
    <tbody>
        <tr>
            <td>
                <img src="https://cloud.githubusercontent.com/assets/1223565/10561007/498e1212-7525-11e5-8252-81503b3d6184.png" alt="tmux and vim on macOS" width="100%">
            </td>
        </tr>
        <tr align="center">
            <td>macOS</td>
        </td>
    </tbody>
</table>

## License

The code is available under the [MIT license][license].

<!-- Link labels: -->

[directories]: src/os/create_directories.sh
[dotfiles mathias]: https://github.com/mathiasbynens/dotfiles
[github mathias ]: https://github.com/mathiasbynens
[license]: LICENSE.txt
[setup line]: https://github.com/alrra/dotfiles/blob/1503cf23ef23f6e31342b140bcd246625160b94f/src/os/setup.sh#L3
[setup]: src/os/setup.sh
[shell]: src/shell
[symlink]: src/os/create_symbolic_links.sh

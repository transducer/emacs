# .spacemacs
The configuration file can be used with [Spacemacs](https://github.com/syl20bnr/spacemacs).

It provides a Clojure friendly Spacemacs configuration, thanks to the folks of Spacemacs.

## Installation

### Installation (Linux Mint)

    sudo apt-get install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev
    sudo add-apt-repository ppa:ubuntu-elisp/ppa
    sudo apt-get update
    sudo apt-get install emacs-snapshot emacs-snapshot-el

    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    wget https://raw.githubusercontent.com/erooijak/emacs/master/.spacemacs -P ~
    emacs &

### Installation (macOS)

    # https://github.com/d12frosted/homebrew-emacs-plus
    brew tap d12frosted/emacs-plus
    brew install emacs-plus
    brew linkapps emacs-plus

    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    wget https://raw.githubusercontent.com/erooijak/emacs/master/.spacemacs -P ~
    emacs &

### Fonts

- The font is set to DejaVu Sans Mono. Download and install from [https://www.fontsquirrel.com/fonts/dejavu-sans-mono](https://www.fontsquirrel.com/fonts/dejavu-sans-mono)
- For NeoTree icons to work install these fonts: [https://github.com/domtronn/all-the-icons.el/tree/master/fonts](https://github.com/domtronn/all-the-icons.el/tree/master/fonts).

## Cider

Add the following to `~/.lein/profiles.clj`

    {:user {:plugins [[lein-try "0.4.3"]]}
     :repl {:plugins [[cider/cider-nrepl "0.16.0"]
                      [refactor-nrepl "2.3.1"]]
            :dependencies [[alembic "0.3.2"]
                           [org.clojure/tools.nrepl "0.2.12"]]}}


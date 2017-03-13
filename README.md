# .spacemacs
The configuration file can be used with [Spacemacs](https://github.com/syl20bnr/spacemacs).

It provides a Clojure friendly Spacemacs configuration, thanks to the folks of Spacemacs.

## Ubuntu Mono

The font is set to Ubuntu Mono. Download and install from http://font.ubuntu.com/.

## Installation (Linux Mint)

    sudo apt-get install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev
    sudo add-apt-repository ppa:ubuntu-elisp/ppa
    sudo apt-get update
    sudo apt-get install emacs-snapshot emacs-snapshot-el

    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    wget https://raw.githubusercontent.com/erooijak/emacs/master/.spacemacs -P ~
    emacs &

## Installation (Mac)

    # https://github.com/d12frosted/homebrew-emacs-plus
    brew tap d12frosted/emacs-plus
    brew install emacs-plus
    brew linkapps emacs-plus

    git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
    wget https://raw.githubusercontent.com/erooijak/emacs/master/.spacemacs -P ~
    emacs &


# this is a Clojure-friendly emacs config with EVIL-mode

The configuration is extended from
[this introductory tutorial](http://www.braveclojure.com/basic-emacs/)!

## Installation (Linux Mint)

    sudo apt-get install build-essential texinfo libx11-dev libxpm-dev libjpeg-dev libpng-dev libgif-dev libtiff-dev libgtk2.0-dev libncurses-dev
    sudo add-apt-repository ppa:ubuntu-elisp/ppa
    sudo apt-get update
    sudo apt-get install emacs-snapshot emacs-snapshot-el
    git clone git@github.com:erooijak/emacs.git
    cp -rf emacs/.emacs.d/ ~/
    emacs &

## Installation (Mac)

    brew install emacs --with-cocoa --with-gnutls
    git clone git@github.com:erooijak/emacs.git
    cp -rf emacs/.emacs.d/ ~/
    emacs &

## Organization

I've tried to separate everything logically and document the purpose
of every line. [`init.el`](./init.el) acts as a kind of table of
contents.  It's a good idea to eventually go through `init.el` and the
files under the `customizations` directory so that you know exactly
what's going on.

## Supporting CSS, HTML, JS, etc.

Emacs has decent support for CSS, HTML, JS, and many other file types out of the box, but if you want better support, then have a look at [the Clojure for the Brave and True author's config's init.el](https://github.com/flyingmachine/emacs.d/blob/master/init.el). 

In general, if you want to add support for a language then you should be able to find good instructions for it through Google. Most of the time, you'll just need to install the "x-lang-mode" package for it.

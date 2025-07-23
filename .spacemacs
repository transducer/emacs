;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     neotree
     csv
     nginx
     python
     asciidoc
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-sort-by-usage t)
     better-defaults
     csharp
     chrome
     colors
     command-log
     (clojure :variables
              ;; clojure-enable-sayid nil
              clojure-enable-clj-refactor t
              clojure-backend 'cider
              clojure-enable-linters 'clj-kondo)
     emacs-lisp
     emoji
     erlang
     ess
     git
     (go :variables go-backend 'lsp)
     graphviz
     html
     javascript
     java
     kubernetes
     (latex :variables latex-build-command "LaTeX")
     (llm-client :variables llm-client-enable-gptel t)
     markdown
     org
     plantuml
     ranger
     react
     restclient
     ruby
     rust
     (shell :variables
            shell-default-height 30
            shell-default-shell 'ansi-term
            shell-default-position 'bottom)
     (spell-checking
      :variables
      spell-checking-enable-by-default nil
      enable-flyspell-auto-completion t)
     spotify
     sql
     syntax-checking
     (terraform :variables terraform-auto-format-on-save t)
     version-control
     yaml
     emoji
     (c-c++ :variables c-c++-enable-clang-support t)
     semantic)



   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      company-solidity
                                      doom-themes
                                      evil-mc
                                      prettier-js
                                      rjsx-mode
                                      solidity-mode
                                      writegood-mode
                                      highlight-indentation
                                      all-the-icons
                                      flycheck-joker
                                      flycheck-clj-kondo
                                      org-contrib
                                      org-sidebar
                                      languagetool
                                      zprint-mode
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    code-review
                                    )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only

   native-comp-async-report-warnings-errors nil

   cider-repl-display-help-banner nil

   ;; LaTeX export (with code highlighting)
   org-export-latex-listings 'minted
   org-clock-persist 'history
   ))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 2048 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; Scale factor controls the scaling (size) of the startup banner. Default
   ;; value is `auto' for scaling the logo automatically to fit all buffer
   ;; contents, to a maximum of the full image height and a minimum of 3 line
   ;; heights. If set to a number (int or float) it is used as a constant
   ;; scaling factor for the default logo size.
   dotspacemacs-startup-banner-scale 'auto

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; If non-nil, show file icons for entries and headings on Spacemacs home buffer.
   ;; This has no effect in terminal or if "all-the-icons" package or the font
   ;; is not installed. (default nil)
   dotspacemacs-startup-buffer-show-icons nil

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(doom-molokai
                         doom-peacock
                         doom-dracula
                         spacemacs-dark
                         spacemacs-light
                         doom-one-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("DejaVu Sans Mono" ; Noto Sans Mono Light, Input,
                               ;; Ubuntu Mono, Courier Prime,
                               ;; Source Code Pro ExtraLight
                               :size 16.0 ; 26
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup t

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes the
   ;; transparency level of a frame background when it's active or selected. Transparency
   ;; can be toggled through `toggle-background-transparency'. (default 90)
   dotspacemacs-background-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but only visual lines are counted. For example, folded lines will not be
   ;; counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'relative

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server t

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed

   ;; If non-nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfere with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non-nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non-nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil

   ;;; JavaScript
   js2-strict-trailing-comma-warning nil
   ;; Double spaces
   c-basic-offset 2
   css-indent-offset 2
   javascript-indent-level 2
   js-indent-level 2
   js2-basic-offset 2
   web-mode-attr-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-markup-indent-offset 2
   ;; NeoTree icons
   neo-theme 'icons
   ;; Magit
   magit-prefer-remote-upstream t
   ;; Cider
   cider-enrich-classpath nil

   undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo"))

   org-latex-pdf-process
   '("pdflatex -shell-escape -interaction nonstopmode %f"
     "bibtex %b"
     "pdflatex -shell-escape -interaction nonstopmode %f"
     "pdflatex -shell-escape -interaction nonstopmode %f")

   lsp-headerline-breadcrumb-enable-diagnostics nil
   lsp-enable-on-type-formatting nil
   lsp-enable-indentation nil
   lsp-enable-symbol-highlighting nil
   lsp-ui-sideline-enable nil
   lsp-headerline-breadcrumb-enable nil
   lsp-signature-render-documentation nil
   lsp-signature-function 'lsp-signature-posframe
   lsp-signature-auto-activate nil
   lsp-semantic-tokens-enable nil
   lsp-enable-indentation nil
   lsp-idle-delay 0.05
   lsp-use-plists nil
   lsp-ui-doc-enable nil
   ;; lsp-ui-peek-enable nil

   helm-ag-use-agignore nil

   plantuml-java-command "java"
   plantuml-java-command "/opt/homebrew/opt/openjdk/bin/java"
   plantuml-jar-path "~/plantuml.jar"
   ))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env)
  )

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."
  )


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )


(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."
  ;; Fix Spacemacs/helm bug
  ;; https://github.com/syl20bnr/spacemacs/pull/10196#issuecomment-359213211
  (with-eval-after-load 'helm
    (setq helm-display-function 'helm-default-display-buffer))

  ;; Remap ; to : and vice versa
  (define-key evil-normal-state-map (kbd ";") 'evil-ex)
  (define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)

  ;; Fix forward jump
  (define-key evil-normal-state-map (kbd "C-i") 'evil-jump-forward)

  ;; Print eval sexp
  (define-key evil-normal-state-map (kbd "C-;") 'cider-pprint-eval-last-sexp-to-comment)

  ;; Number incrementing C-a C-x
  (define-key evil-normal-state-map (kbd "g>") 'evil-numbers/inc-at-pt)
  (define-key evil-visual-state-map (kbd "g>") 'evil-numbers/inc-at-pt)
  (define-key evil-normal-state-map (kbd "g<") 'evil-numbers/dec-at-pt)
  (define-key evil-visual-state-map (kbd "g<") 'evil-numbers/dec-at-pt)

  ;; Wrap lines
  (global-visual-line-mode t)

  ;; Execute code in org-mode
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)
     (emacs-lisp . t)))

  ;; Presentation
  (require 'ox-beamer)
  (setq org-export-backends '(beamer html latex md gfm))

  (org-clock-persistence-insinuate)

  ;; Vim clipboard pasting
  (setq x-select-enable-clipboard nil)
  (fset 'evil-visual-update-x-selection 'ignore)

  ;; Press TAB to align tables in markdown, org or asciidoc mode.
  (add-hook 'adoc-mode-hook 'turn-on-orgtbl)
  (add-hook 'org-mode-hook 'turn-on-orgtbl)
  (add-hook 'markdown-mode-hook 'turn-on-orgtbl)

  (add-hook 'neotree-mode-hook (lambda () (visual-line-mode -1)))

  (add-to-list 'auto-mode-alist '("\\.rest$" . restclient-mode))
  (add-to-list 'auto-mode-alist '("\\.pum$" . plantuml-mode))
  (add-to-list 'auto-mode-alist '("\\.less$" . rainbow-mode))
  (add-to-list 'auto-mode-alist '("\\.less$" . css-mode))
  (add-to-list 'auto-mode-alist '("\\.css$" . rainbow-mode))
  (add-to-list 'auto-mode-alist '("\\.css$" . css-mode))
  (add-to-list 'auto-mode-alist '("\\.sol$" . solidity-mode))
  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("containers\\/.*\\.js\\'" . rjsx-mode))
  ;; (with-eval-after-load 'web-mode
  ;;   (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
  ;;   (add-to-list 'web-mode-indentation-params '("lineup-concats" . nil))
  ;;   (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil)))

  ;; Bigger font sizes
  (if (eq system-type 'darwin) ;; OSX
      (set-face-attribute 'default nil :height 200)
    (set-face-attribute 'default nil :height 160))

  ;; Search white space
  (setq search-whitespace-regexp nil)

  ;; Multiple cursors
  (use-package evil-mc
    :ensure t
    :config
    (defun evil--mc-make-cursor-at-col (startcol _endcol orig-line)
      (move-to-column startcol)
      (unless (= (line-number-at-pos) orig-line)
        (evil-mc-make-cursor-here)))
    (defun evil-mc-make-vertical-cursors (beg end)
      (interactive (list (region-beginning) (region-end)))
      (evil-mc-pause-cursors)
      (apply-on-rectangle #'evil--mc-make-cursor-at-col
                          beg end (line-number-at-pos (point)))
      (evil-mc-resume-cursors)
      (evil-normal-state)
      (move-to-column (evil-mc-column-number (if (> end beg)
                                                 beg
                                               end)))))
  (global-evil-mc-mode t)

  ;; (global-emojify-mode t)

  (setq TeX-engine 'xetex)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)

  (setq cider-check-cljs-repl-requirements nil)

  ;; (add-hook 'clojure-mode-hook
  ;;           (lambda () (add-hook 'before-save-hook 'cider-format-buffer nil 'local)))

  (add-hook 'clojure-mode-hook 'aggressive-indent-mode) ; does not work with lsp (?)

  (add-hook 'clojure-mode-hook
            (lambda () (setq cider-cljs-lein-repl
                             "(do (require 'figwheel-sidecar.repl-api)
                                  (figwheel-sidecar.repl-api/start-figwheel!)
                                  (figwheel-sidecar.repl-api/cljs-repl))")))

  ;; Show YAML indentation visually
  (add-hook 'yaml-mode-hook 'highlight-indentation-mode)
  (add-hook 'yaml-mode-hook 'highlight-indentation-current-column-mode)

  ;; Babashka
  (defvar bb-repl
    nil)

  (defun bb-repl-sentinel (process event)
    (when (equal event "hangup\n")
      (setq bb-repl nil)))

  (defun cider-jack-in-bb ()
    (interactive)
    (when (not bb-repl)
      (let* ((deps-location (locate-dominating-file default-directory "bb.edn"))
             (default-directory (or deps-location default-directory))
             (proc (start-process "BB Repl" "*bb-repl*" "bb" "--nrepl-server")))
        (set-process-sentinel proc 'bb-repl-sentinel)
        (setq bb-repl proc)))
    (cider-connect-clj '(:host "127.0.0.1" :port 1667)))

  (add-hook 'clojure-mode-hook 'lsp)
  (add-hook 'clojurescript-mode-hook 'lsp)
  (add-hook 'clojurec-mode-hook 'lsp)

  ;; Solidity
  (add-hook 'solidity-mode-hook
            (lambda ()
              (set (make-local-variable 'company-backends)
                   (append '((company-solidity company-capf company-dabbrev-code))
                           company-backends))))

  (with-eval-after-load 'ox-latex
    (add-to-list 'org-latex-classes
                 '("tufte-book"
                   "\\documentclass{tufte-book}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

    (add-to-list 'org-latex-classes
                 '("extarticle"
                   "\\documentclass{extarticle}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

    )


  (define-key evil-normal-state-map (kbd "<SPC>py") 'org-sidebar-tree-toggle)

  (use-package languagetool
    :ensure t
    :defer t
    :commands (languagetool-check
               languagetool-clear-suggestions
               languagetool-correct-at-point
               languagetool-correct-buffer
               languagetool-set-language
               languagetool-server-mode
               languagetool-server-start
               languagetool-server-stop)
    :config
    ;; Download from: https://languagetool.org/download/LanguageTool-stable.zip
    (setq languagetool-java-arguments '("-Dfile.encoding=UTF-8")
          languagetool-console-command "~/.languagetool/languagetool-commandline.jar"
          languagetool-server-command "~/.languagetool/languagetool-server.jar"))

  (define-key evil-normal-state-map (kbd "<SPC>Sf") 'languagetool-correct-at-point)
  (define-key evil-normal-state-map (kbd "<SPC>Sl") 'languagetool-check)

  (require 'ox-extra)
  (ox-extras-activate '(ignore-headlines))

  ;; Prevent growing of savehist file
  ;; See https://github.com/syl20bnr/spacemacs/issues/9409
  (setq history-length 100)
  (put 'minibuffer-history 'history-length 50)
  (put 'evil-ex-history 'history-length 50)
  (put 'kill-ring 'history-length 25)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(evil-escape-unordered-key-sequence t)
   '(ignored-local-variable-values
     '((cider-shadow-default-options . "dev") (cider-default-cljs-repl . shadow)
       (cider-preferred-build-tool . shadow-cljs)
       (cider-shadow-cljs-default-options . "app")))
   '(package-selected-packages
     '(ac-ispell ace-jump-helm-line ace-link ace-window adoc-mode aggressive-indent
                 alert auto-compile auto-dictionary auto-highlight-symbol
                 auto-yasnippet blacken browse-at-remote bui bundler ccls
                 centered-cursor-mode cfrs chruby cider-eval-sexp-fu
                 clean-aindent-mode clj-refactor clojure-snippets
                 color-identifiers-mode column-enforce-mode command-log-mode
                 company-anaconda company-auctex company-c-headers company-emoji
                 company-math company-php company-phpactor company-quickhelp
                 company-reftex company-restclient company-rtags company-solidity
                 company-statistics company-web company-ycmd compat consult
                 copilot cpp-auto-include csv-mode cython-mode dap-mode
                 define-word devdocs diminish dired-quick-sort disaster
                 doom-themes dotenv-mode drag-stuff drupal-mode dumb-jump
                 edit-server editorconfig elisp-def elisp-slime-nav ellama
                 emmet-mode emoji-cheat-sheet-plus emojify emr erlang esh-help
                 eshell-prompt-extras eshell-z evil-anzu evil-args
                 evil-cleverparens evil-collection evil-easymotion evil-ediff
                 evil-escape evil-exchange evil-goggles evil-iedit-state
                 evil-indent-plus evil-lion evil-lisp-state evil-matchit evil-mc
                 evil-nerd-commenter evil-numbers evil-org evil-surround
                 evil-terminal-cursor-changer evil-textobj-line evil-tutor
                 evil-unimpaired evil-visual-mark-mode evil-visualstar
                 expand-region eyebrowse fancy-battery flx-ido flycheck-clj-kondo
                 flycheck-elsa flycheck-package flycheck-pos-tip flycheck-rtags
                 flycheck-ycmd flymd flyspell-correct-helm flyspell-popup
                 font-lock+ fuzzy geben gendoxy ggtags gh-md git-gutter-fringe
                 git-link git-messenger git-modes git-timemachine
                 gitignore-templates gmail-message-mode gntp gnuplot golden-ratio
                 google-c-style google-translate gptel graphviz-dot-mode
                 groovy-imports groovy-mode hcl-mode helm-c-yasnippet helm-cider
                 helm-company helm-css-scss helm-descbinds helm-flx helm-git-grep
                 helm-gtags helm-ls-git helm-lsp helm-make helm-mode-manager
                 helm-org helm-org-rifle helm-projectile helm-purpose helm-pydoc
                 helm-rtags helm-spotify-plus helm-swoop helm-themes helm-xref
                 hide-comnt highlight-indentation highlight-numbers
                 highlight-parentheses hl-todo hungry-delete hybrid-mode
                 impatient-mode importmagic indent-guide info+ inspector js-doc
                 js2-refactor json-mode json-navigator json-reformat keycast
                 kubernetes-evil kubernetes-tramp languagetool link-hint
                 live-py-mode livid-mode llm log4e lorem-ipsum lsp-docker lsp-java
                 lsp-latex lsp-mode lsp-origami lsp-pyright lsp-python-ms
                 lsp-treemacs lsp-ui macrostep markdown-toc maven-test-mode
                 meghanada minitest mmm-mode multi-line multi-term mvn mwim
                 nameless neotree nginx-mode nodejs-repl nose npm-mode ob-http
                 ob-restclient omnisharp open-junk-file org-category-capture
                 org-cliplink org-contrib org-download org-mime org-pomodoro
                 org-present org-project-capture org-projectile org-ql
                 org-rich-yank org-sidebar org-super-agenda org-superstar orgit
                 orgit-forge origami ov overseer paradox password-generator pcache
                 peg persp-mode pfuture php-auto-yasnippets php-extras phpcbf
                 phpunit pip-requirements pipenv pippel plantuml-mode plz
                 plz-event-source plz-media-type poetry popwin prettier-js
                 pug-mode py-isort pydoc pyenv-mode pytest quickrun
                 rainbow-delimiters rainbow-identifiers rainbow-mode rake ranger
                 rbenv restart-emacs restclient-helm rjsx-mode robe rspec-mode
                 rubocop rubocopfmt ruby-hash-syntax ruby-refactor ruby-test-mode
                 ruby-tools rvm sass-mode scss-mode seeing-is-believing shell-pop
                 slim-mode smeargle spaceline-all-the-icons sphinx-doc spotify
                 sql-indent srefactor stickyfunc-enhance string-edit
                 string-inflection symbol-overlay symon tagedit terminal-here tern
                 toc-org treemacs ts undo-tree unfill use-package uuidgen
                 vi-tilde-fringe volatile-highlights vterm web-beautify web-mode
                 which-key winum writegood-mode writeroom-mode ws-butler
                 xterm-color yaml-mode yapfify yasnippet-snippets zen-mode
                 zprint-mode))
   '(warning-suppress-log-types '((with-editor))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(highlight-parentheses-highlight ((nil (:weight ultra-bold))) t))
  )

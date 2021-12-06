;; -*- mode: emacs-lisp -*-
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
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     php
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
              clojure-enable-sayid t
              clojure-enable-clj-refactor t
              clojure-backend 'cider
              clojure-enable-linters 'clj-kondo)
     emacs-lisp
     emoji
     erlang
     (git :variables
          git-enable-github-support t)
     graphviz
     gtags
     html
     javascript
     kubernetes
     (latex :variables latex-build-command "LaTeX")
     markdown
     org
     plantuml
     ranger
     react
     restclient
     ruby
     (shell :variables
            shell-default-height 30
            shell-default-shell 'ansi-term
            shell-default-position 'bottom)
     ;; (spell-checking :variables
     ;;                 spell-checking-enable-auto-dictionary t)
     spotify
     sql
     syntax-checking
     version-control
     yaml
     emoji
     (c-c++ :variables c-c++-enable-clang-support t)
     semantic
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
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
     )

   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
    ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
    ;; possible. Set it to nil if you have no way to use HTTPS in your
    ;; environment, otherwise it is strongly recommended to let it set to t.
    ;; This variable has no effect if Emacs is launched with the parameter
    ;; `--insecure' which forces the value of this variable to nil.
    ;; (default t)
    dotspacemacs-elpa-https t
    ;; Maximum allowed time in seconds to contact an ELPA repository.
    dotspacemacs-elpa-timeout 5
    ;; If non nil then spacemacs will check for updates at startup
    ;; when the current branch is not `develop'. (default t)
    dotspacemacs-check-for-update t
    ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
    ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
    ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
    ;; unchanged. (default 'vim)
    dotspacemacs-editing-style 'vim
    ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
    dotspacemacs-verbose-loading nil
    ;; Specify the startup banner. Default value is `official', it displays
    ;; the official spacemacs logo. An integer value is the index of text
    ;; banner, `random' chooses a random text banner in `core/banners'
    ;; directory. A string value must be a path to an image format supported
    ;; by your Emacs build.
    ;; If the value is nil then no banner is displayed. (default 'official)
    dotspacemacs-startup-banner 'official
    ;; List of items to show in the startup buffer. If nil it is disabled.
    ;; Possible values are: `recents' `bookmarks' `projects'.
    ;; (default '(recents projects))
    dotspacemacs-startup-lists '(recents projects)
    ;; Number of recent files to show in the startup buffer. Ignored if
    ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
    dotspacemacs-startup-recent-list-size 5
    ;; Default major mode of the scratch buffer (default `text-mode')
    dotspacemacs-scratch-mode 'text-mode
    ;; List of themes, the first of the list is loaded when spacemacs starts.
    ;; Press <SPC> T n to cycle to the next theme in the list (works great
    ;; with 2 themes variants, one dark and one light)
    dotspacemacs-themes '(doom-molokai
                           doom-peacock
                           doom-dracula
                           spacemacs-dark
                           spacemacs-light)
    ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
    ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
    ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
    ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
    ;; refer to the DOCUMENTATION.org for more info on how to create your own
    ;; spaceline theme. Value can be a symbol or list with additional properties.
    ;; (default '(spacemacs :separator wave :separator-scale 1.5))
    dotspacemacs-mode-line-theme '(vim-powerline :separator nil)
    ;; If non nil the cursor color matches the state color in GUI Emacs.
    dotspacemacs-colorize-cursor-according-to-state t
    ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
    ;; size to make separators look not too crappy.
    dotspacemacs-default-font '("DejaVu Sans Mono" ; Noto Sans Mono Light, Input,
                                        ; Ubuntu Mono, Courier Prime,
                                        ; Source Code Pro ExtraLight
                                 :size 16.0 ; 26
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1.1)
    ;; The leader key
    dotspacemacs-leader-key "SPC"
    ;; The leader key accessible in `emacs state' and `insert state'
    ;; (default "M-m")
    dotspacemacs-emacs-leader-key "M-m"
    ;; Major mode leader key is a shortcut key which is the equivalent of
    ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
    dotspacemacs-major-mode-leader-key ","
    ;; Major mode leader key accessible in `emacs state' and `insert state'.
    ;; (default "C-M-m)
    dotspacemacs-major-mode-emacs-leader-key "C-M-m"
    ;; These variables control whether separate commands are bound in the GUI to
    ;; the key pairs C-i, TAB and C-m, RET.
    ;; Setting it to a non-nil value, allows for separate commands under <C-i>
    ;; and TAB or <C-m> and RET.
    ;; In the terminal, these pairs are generally indistinguishable, so this only
    ;; works in the GUI. (default nil)
    dotspacemacs-distinguish-gui-tab t
    ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
    ;; The command key used for Evil commands (ex-commands) and
    ;; Emacs commands (M-x).
    ;; By default the command key is `:' so ex-commands are executed like in Vim
    ;; with `:' and Emacs commands are executed with `<leader> :'.
    dotspacemacs-command-key ":"
    ;; If non nil `Y' is remapped to `y$'. (default t)
    dotspacemacs-remap-Y-to-y$ t
    ;; Name of the default layout (default "Default")
    dotspacemacs-default-layout-name "Default"
    ;; If non nil the default layout name is displayed in the mode-line.
    ;; (default nil)
    dotspacemacs-display-default-layout nil
    ;; If non nil then the last auto saved layouts are resume automatically upon
    ;; start. (default nil)
    dotspacemacs-auto-resume-layouts nil
    ;; Location where to auto-save files. Possible values are `original' to
    ;; auto-save the file in-place, `cache' to auto-save the file to another
    ;; file stored in the cache directory and `nil' to disable auto-saving.
    ;; (default 'cache)
    dotspacemacs-auto-save-file-location 'cache
    ;; Maximum number of rollback slots to keep in the cache. (default 5)
    dotspacemacs-max-rollback-slots 5
    ;; If non nil then `ido' replaces `helm' for some commands. For now only
    ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
    ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
    dotspacemacs-use-ido nil
    ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
    dotspacemacs-helm-resize nil
    ;; if non nil, the helm header is hidden when there is only one source.
    ;; (default nil)
    dotspacemacs-helm-no-header nil
    ;; define the position to display `helm', options are `bottom', `top',
    ;; `left', or `right'. (default 'bottom)
    dotspacemacs-helm-position 'bottom
    ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
    ;; several times cycle between the kill ring content. (default nil)
    dotspacemacs-enable-paste-micro-state nil
    ;; Which-key delay in seconds. The which-key buffer is the popup listing
    ;; the commands bound to the current keystroke sequence. (default 0.4)
    dotspacemacs-which-key-delay 0.4
    ;; Which-key frame position. Possible values are `right', `bottom' and
    ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
    ;; right; if there is insufficient space it displays it at the bottom.
    ;; (default 'bottom)
    dotspacemacs-which-key-position 'bottom
    ;; If non nil a progress bar is displayed when spacemacs is loading. This
    ;; may increase the boot time on some systems and emacs builds, set it to
    ;; nil to boost the loading time. (default t)
    dotspacemacs-loading-progress-bar t
    ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
    ;; (Emacs 24.4+ only)
    dotspacemacs-fullscreen-at-startup t
    ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
    ;; Use to disable fullscreen animations in OSX. (default nil)
    dotspacemacs-fullscreen-use-non-native t
    ;; If non nil the frame is maximized when Emacs starts up.
    ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
    ;; (default nil) (Emacs 24.4+ only)
    dotspacemacs-maximized-at-startup t
    ;; A value from the range (0..100), in increasing opacity, which describes
    ;; the transparency level of a frame when it's active or selected.
    ;; Transparency can be toggled through `toggle-transparency'. (default 90)
    dotspacemacs-active-transparency 90
    ;; A value from the range (0..100), in increasing opacity, which describes
    ;; the transparency level of a frame when it's inactive or deselected.
    ;; Transparency can be toggled through `toggle-transparency'. (default 90)
    dotspacemacs-inactive-transparency 90
    ;; If non nil unicode symbols are displayed in the mode line. (default t)
    dotspacemacs-mode-line-unicode-symbols t
    ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
    ;; scrolling overrides the default behavior of Emacs which recenters the
    ;; point when it reaches the top or bottom of the screen. (default t)
    dotspacemacs-smooth-scrolling t
    ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
    ;; derivatives. If set to `relative', also turns on relative line numbers.
    ;; (default nil)
    dotspacemacs-line-numbers 'relative
    ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
    ;; (default nil)
    dotspacemacs-smartparens-strict-mode nil
    ;; Select a scope to highlight delimiters. Possible values are `any',
    ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
    ;; emphasis the current one). (default 'all)
    dotspacemacs-highlight-delimiters 'all
    ;; If non nil advises quit functions to keep server open when quitting.
    ;; (default nil)
    dotspacemacs-persistent-server nil
    ;; List of search tool executable names. Spacemacs uses the first installed
    ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
    ;; (default '("ag" "pt" "ack" "grep"))
    dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
    ;; The default package repository used if no explicit repository has been
    ;; specified with an installed package.
    ;; Not used for now. (default nil)
    dotspacemacs-default-package-repository nil
    ;; Delete whitespace while saving buffer. Possible values are `all'
    ;; to aggressively delete empty line and long sequences of whitespace,
    ;; `trailing' to delete only the whitespace at end of lines, `changed'to
    ;; delete only whitespace for changed lines or `nil' to disable cleanup.
    ;; (default nil)
    dotspacemacs-whitespace-cleanup 'changed
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


    ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

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

  ;; Vim clipboard pasting
  (setq x-select-enable-clipboard nil)
  (fset 'evil-visual-update-x-selection 'ignore)

  ;; Press TAB to align tables in markdown or asciidoc mode.
  (add-hook 'adoc-mode-hook 'turn-on-orgtbl)
  (add-hook 'markdown-mode-hook 'turn-on-orgtbl)


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

  ;; Presentation
  (require 'ox-beamer)
  (setq org-export-backends '(beamer html latex md gfm))

  ;; Execute code in org-mode
  (org-babel-do-load-languages
    'org-babel-load-languages
    '((shell . t)
       (emacs-lisp . t)))

  ;; LaTeX export (with code highlighting)
  (setq org-export-latex-listings 'minted)

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

  (add-hook 'clojure-mode-hook 'aggressive-indent-mode)

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
    (cider-connect-clj '(:host "127.0.0.1" :port 1667))))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#101010" "#803030" "#4b762f" "#aa9943" "#324c80" "#a06c9a" "#82b4ae" "#ededed"])
 '(cider-latest-middleware-version "0.19.0" t)
 '(cider-repl-display-help-banner nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#20240E" t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (flycheck-joker flycheck-clj-kondo omnisharp csharp-mode kubernetes-evil kubernetes transient undo-tree lv parseedn parseclj a phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode emojify circe oauth2 websocket ht editorconfig org-mime powerline org-category-capture alert log4e gntp parent-mode projectile request markdown-mode gitignore-mode fringe-helper git-gutter+ git-gutter flycheck flx magit magit-popup git-commit ghub treepy let-alist graphql with-editor smartparens iedit anzu evil goto-chg diminish pos-tip company hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider sesman seq spinner queue pkg-info clojure-mode epl bind-map bind-key yasnippet packed markup-faces helm avy helm-core async auto-complete popup s csv-mode rjsx-mode prettier-js nginx-mode doom-one-light-theme doom-themes all-the-icons memoize yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic company-solidity emoji-cheat-sheet-plus company-emoji base16-theme helm-spotify-plus spotify helm-spotify multi solidity-mode winum unfill restclient-helm ob-restclient madhat2r-theme fuzzy flymd company-restclient know-your-http-well rainbow-mode rainbow-identifiers color-identifiers-mode solarized-theme himisu-light-theme cider-decompile sql-indent gmail-message-mode ham-mode html-to-markdown edit-server auctex-latexmk company-auctex auctex plantuml-mode minitest hide-comnt graphviz-dot-mode erlang rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake chruby bundler inf-ruby restclient ob-http writegood-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode uuidgen org-projectile org-download mwim link-hint git-link flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump f darkokai-theme column-enforce-mode clojure-snippets zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle shell-pop seti-theme reverse-theme restart-emacs ranger rainbow-delimiters railscasts-theme quelpa purple-haze-theme professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox page-break-lines orgit organic-green-theme org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flyspell helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md ggtags gandalf-theme flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu espresso-theme eshell-prompt-extras esh-help elisp-slime-nav dracula-theme django-theme diff-hl define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-statistics company-quickhelp command-log-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clj-refactor clean-aindent-mode cider-eval-sexp-fu cherry-blossom-theme busybee-theme buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adoc-mode adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(projectile-use-git-grep t)
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(solidity-solc-path "/usr/bin/local/bin/solc")
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822" :family "DejaVu Sans Mono" :foundry "nil" :slant normal :weight normal :height 160 :width normal)) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C" :family "DejaVu Sans Mono" :foundry "nil" :slant normal :weight normal :height 160 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(term ((t (:inherit default)))))
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
  '(ansi-color-names-vector
     ["#101010" "#803030" "#4b762f" "#aa9943" "#324c80" "#a06c9a" "#82b4ae" "#ededed"])
 '(cider-latest-middleware-version "0.19.0" t)
 '(cider-repl-display-help-banner nil)
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#20240E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
  '(highlight-symbol-colors
     (--map
       (solarized-color-blend it "#002b36" 0.25)
       (quote
         ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
  '(highlight-tail-colors
     (quote
       (("#20240E" . 0)
         ("#679A01" . 20)
         ("#4BBEAE" . 30)
         ("#1DB4D0" . 50)
         ("#9A8F21" . 60)
         ("#A75B00" . 70)
         ("#F309DF" . 85)
         ("#20240E" . 100))))
  '(hl-bg-colors
     (quote
       ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
  '(hl-fg-colors
     (quote
       ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(magit-diff-use-overlays nil)
  '(nrepl-message-colors
     (quote
       ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
  '(package-selected-packages
     (quote
       (dap-mode lsp-treemacs bui treemacs cfrs pfuture posframe flycheck-joker flycheck-clj-kondo omnisharp csharp-mode kubernetes-evil kubernetes transient undo-tree lv parseedn parseclj a phpunit phpcbf php-extras php-auto-yasnippets drupal-mode php-mode emojify circe oauth2 websocket ht editorconfig org-mime powerline org-category-capture alert log4e gntp parent-mode projectile request markdown-mode gitignore-mode fringe-helper git-gutter+ git-gutter flycheck flx magit magit-popup git-commit ghub treepy let-alist graphql with-editor smartparens iedit anzu evil goto-chg diminish pos-tip company hydra inflections edn multiple-cursors paredit peg eval-sexp-fu highlight cider sesman seq spinner queue pkg-info clojure-mode epl bind-map bind-key yasnippet packed markup-faces helm avy helm-core async auto-complete popup s csv-mode rjsx-mode prettier-js nginx-mode doom-one-light-theme doom-themes all-the-icons memoize yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode helm-pydoc cython-mode company-anaconda anaconda-mode pythonic company-solidity emoji-cheat-sheet-plus company-emoji base16-theme helm-spotify-plus spotify helm-spotify multi solidity-mode winum unfill restclient-helm ob-restclient madhat2r-theme fuzzy flymd company-restclient know-your-http-well rainbow-mode rainbow-identifiers color-identifiers-mode solarized-theme himisu-light-theme cider-decompile sql-indent gmail-message-mode ham-mode html-to-markdown edit-server auctex-latexmk company-auctex auctex plantuml-mode minitest hide-comnt graphviz-dot-mode erlang rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake chruby bundler inf-ruby restclient ob-http writegood-mode web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc company-tern dash-functional tern coffee-mode uuidgen org-projectile org-download mwim link-hint git-link flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump f darkokai-theme column-enforce-mode clojure-snippets zonokai-theme zenburn-theme zen-and-art-theme yaml-mode xterm-color ws-butler window-numbering which-key volatile-highlights vi-tilde-fringe use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme spacemacs-theme spaceline spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smooth-scrolling smeargle shell-pop seti-theme reverse-theme restart-emacs ranger rainbow-delimiters railscasts-theme quelpa purple-haze-theme professional-theme popwin planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox page-break-lines orgit organic-green-theme org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow macrostep lush-theme lorem-ipsum linum-relative light-soap-theme leuven-theme jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide ido-vertical-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gtags helm-gitignore helm-flyspell helm-flx helm-descbinds helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe git-gutter-fringe+ gh-md ggtags gandalf-theme flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu espresso-theme eshell-prompt-extras esh-help elisp-slime-nav dracula-theme django-theme diff-hl define-word darktooth-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme company-statistics company-quickhelp command-log-mode colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clj-refactor clean-aindent-mode cider-eval-sexp-fu cherry-blossom-theme busybee-theme buffer-move bubbleberry-theme bracketed-paste birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme adoc-mode adaptive-wrap ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(projectile-use-git-grep t)
  '(safe-local-variable-values
     (quote
       ((cider-shadow-cljs-default-options . "app")
         (javascript-backend . tern)
         (javascript-backend . lsp))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(solidity-solc-path "/usr/bin/local/bin/solc")
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
  '(vc-annotate-color-map
     (quote
       ((20 . "#F92672")
         (40 . "#CF4F1F")
         (60 . "#C26C0F")
         (80 . "#E6DB74")
         (100 . "#AB8C00")
         (120 . "#A18F00")
         (140 . "#989200")
         (160 . "#8E9500")
         (180 . "#A6E22E")
         (200 . "#729A1E")
         (220 . "#609C3C")
         (240 . "#4E9D5B")
         (260 . "#3C9F79")
         (280 . "#A1EFE4")
         (300 . "#299BA6")
         (320 . "#2896B5")
         (340 . "#2790C3")
         (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
  '(weechat-color-list
     (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
  '(xterm-color-names
     ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
  '(xterm-color-names-bright
     ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#F8F8F2" :background "#272822" :family "DejaVu Sans Mono" :foundry "nil" :slant normal :weight normal :height 160 :width normal)) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C" :family "DejaVu Sans Mono" :foundry "nil" :slant normal :weight normal :height 160 :width normal))))
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(term ((t (:inherit default)))))
)

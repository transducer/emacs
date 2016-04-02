(require 'evil)
  (evil-mode 1)

;; (add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
;; (add-hook 'clojure-mode-hook #'evil-smartparens-mode)

;; Make linums relative by default
(linum-mode)
(linum-relative-global-mode)

;; Hide buttons and menu
(menu-bar-mode -1)
(tool-bar-mode -1)

;; Display the actual line number in the middle
(setq linum-relative-current-symbol "")

;; Remap ; to : and vice versa
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)

;; Change paredit slurping and barfing to be on home row
(define-key evil-normal-state-map (kbd "C-.") 'paredit-forward-slurp-sexp) 
(define-key evil-normal-state-map (kbd "C-,") 'paredit-forward-barf-sexp)
(define-key evil-normal-state-map (kbd "C-<") 'paredit-backward-slurp-sexp) 
(define-key evil-normal-state-map (kbd "C->") 'paredit-backward-barf-sexp)

;; surround.vim stuff
(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'powerline)
(powerline-evil-vim-color-theme)
(display-time-mode t)

;; Spaces for tabs
(setq-default tab-width 4 indent-tabs-mode nil)

;; Automatic indentation
(electric-indent-mode 1) 

;; Bind CTRL-B to displaying buffers
(evil-ex-define-cmd "buffers" 'buffer-menu)
(define-key evil-normal-state-map (kbd "C-B") #'buffer-menu)

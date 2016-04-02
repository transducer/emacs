(require 'evil)
(evil-mode 1)

;; (add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)
;; (add-hook 'clojure-mode-hook #'evil-smartparens-mode)


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

;; Bind CTRL-B to displaying buffers
(evil-ex-define-cmd "buffers" 'buffer-menu)
(define-key evil-normal-state-map (kbd "C-B") #'buffer-menu)

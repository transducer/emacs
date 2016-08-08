(require 'evil)
(evil-mode 1)

;; surround.vim stuff
(require 'evil-surround)
(global-evil-surround-mode 1)

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

;; Bind CTRL-B to displaying buffers
(evil-ex-define-cmd "buffers" 'buffer-menu)
(define-key evil-normal-state-map (kbd "C-B") #'buffer-menu)

;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark  t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;; CTRL-U back to Vim-like behaviour (half screen up)
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-u")
  (lambda ()
    (interactive)
    (evil-delete (point-at-bol) (point))))

;; Bind o to neotree-enter
(define-key neotree-mode-map (kbd "o") 'neotree-enter)

;; Proper pasting
(setq x-select-enable-clipboard nil)
(fset 'evil-visual-update-x-selection 'ignore)

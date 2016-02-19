(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
  (package-initialize)

(require 'evil)
  (evil-mode 1)

(require 'quack)

;; Make linums relative by default
(linum-mode)
(linum-relative-global-mode)

;; Remap ; to : and vice versa
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd ":") 'evil-repeat-find-char)

;; surround.vim stuff
(require 'evil-surround)
(global-evil-surround-mode 1)

(custom-set-variables '(inhibit-startup-screen t))
(custom-set-faces)

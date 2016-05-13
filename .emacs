(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

;; (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) 
;; (setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1) 
(setq mouse-wheel-progressive-speed nil)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-splash-screen t)                                 

(global-set-key "\es" 'isearch)
(global-set-key "\eg" 'goto-line) 
(global-set-key "\ej" 'comment-region)
(global-set-key "\el" 'uncomment-region)
(global-set-key "\ec" 'eval-buffer)
(global-set-key "\ew" 'indent-region)
(global-set-key [M-up] 'move-text-up)
(global-set-key [?\C-.] 'beginning-of-buffer)
(global-set-key [?\C-,] 'end-of-buffer)
(global-set-key [M-down] 'move-text-down)
(define-key global-map "\eo" 'find-file) 
(define-key global-map "\eu" 'other-window)
(global-set-key (read-kbd-macro "\en") 'ido-switch-buffer)
(define-key global-map "\ek" 'kill-buffer)
(define-key global-map "\ez" 'undo)
(define-key global-map "\ei" 'split-window-horizontally)
(define-key global-map "\ep" 'delete-other-windows)
(define-key global-map "\eh" 'save-buffer)
(define-key global-map "\es" 'isearch-forward)
(define-key global-map "\er" 'isearch-backward)
;;(define-key global-map "\ev" 'yank)
(define-key key-translation-map [dead-circumflex] "^") 
(define-key key-translation-map [dead-acute] "´") 
(define-key key-translation-map [S-dead-grave] "`") 
(global-set-key "\em" 'backward-kill-line) ;; nicht auf strg setzen!

(defun post-load-stuff ()
  (interactive)
  (menu-bar-mode -1)
  (set-foreground-color "#D5A05A")
  (set-background-color "#161616")
  (set-cursor-color "#40FF40")
)

(set-face-attribute 'default nil :font "Lucida Console 12")
;;(add-to-list 'default-frame-alist '(font . "Liberation Mono-11"))
;;(set-face-attribute 'default t :font "Liberation Mono-11")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;; '(mode-line ((t (:background "white" :foreground "black"))))
 ;; '(highlight-numbers-mode ((t (:foreground "spring green"))))
 ;; '(shadow ((t nil)))
 ;; '(underline ((t nil)))
 ;; '(region ((t (:inherit nil :background "medium blue"))))
 ;; '(vertical-border ((t (:background "red" :foreground "#4e4e4e")))))
 '(border ((t (:background "red"))))
 '(highlight-numbers-number ((t (:foreground "spring green"))))
 '(mode-line ((t (:background "white" :foreground "black"))))
 '(region ((t (:background "medium blue"))))
 '(shadow ((t nil)))
 '(underline ((t nil)))
 '(vertical-border ((t (:background "red" :foreground "#4e4e4e")))))

(add-hook 'window-setup-hook 'post-load-stuff t)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)
(setq compilation-directory-locked nil)
(scroll-bar-mode 1)
(tool-bar-mode 0)

(column-number-mode t)
(cua-mode t)
(ido-mode t) 

(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))

;;(setq mouse-wheel-scroll-amount '(2 ((shift) . 2)))

(setq next-line-add-newline t)

(add-to-list 'load-path "~/.emacs.d/modes/")
;;(add-to-list 'load-path "~/.emacs.d/elpa/")
(load "jai") 

(set-face-attribute 'font-lock-builtin-face nil :foreground "white smoke")
(set-face-attribute 'font-lock-keyword-face nil :foreground "white smoke")
(set-face-attribute 'font-lock-string-face nil :foreground "dark gray")
(set-face-attribute 'font-lock-comment-face nil :foreground "yellow")
(set-face-attribute 'font-lock-doc-face nil :foreground "yellow")

(set-face-attribute 'font-lock-constant-face nil :foreground "spring green");;#7CE656;;#86FF5B
(set-face-attribute 'font-lock-type-face nil :foreground "#86FF5B")
(set-face-attribute 'font-lock-preprocessor-face nil :foreground "#D5A05A");;#86FF5B

(set-face-attribute 'font-lock-function-name-face nil :foreground "white smoke")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#D5A05A")

;; (set-face-attribute 'region nil :background "medium blue")
;; (set-face-attribute 'region nil :foreground "#D5A05A")
(set-face-background 'mode-line "burlywood2")
(set-face-foreground 'mode-line "black")

(set-face-background 'mode-line-inactive "white")
(set-face-foreground 'mode-line-inactive "black")

(setq-default c-basic-offset 4) 

;; This makes emacs not to split horizontally at all.
(setq split-height-threshold nil)
(setq split-width-threshold 0)

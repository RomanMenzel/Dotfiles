;; hier ist die GEILE isearch farbe: #ee799f  xD
;; hier ist auch noch mal die alte burlywood farbe: #D5A05A

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) 
(setq mouse-wheel-follow-mouse 't)
(setq scroll-step 1) 

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq inhibit-splash-screen t)                                 

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
(define-key global-map "\ev" 'yank)
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

(set-face-attribute 'default nil :font "Anonymous Pro 12")
;;(add-to-list 'default-frame-alist '(font . "Liberation Mono-11"))
;;(set-face-attribute 'default t :font "Liberation Mono-11")

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(border ((t (:background "red"))))
 '(highlight-numbers-number ((t (:foreground "spring green"))))
 '(mode-line ((t (:background "white" :foreground "black"))))
 '(region ((t (:background "medium blue"))))
 '(shadow ((t nil)))
 '(underline ((t nil)))
 '(vertical-border ((t (:background "red" :foreground "#4e4e4e")))))

(add-hook 'window-setup-hook 'post-load-stuff t)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

(setq undo-limit 20000000)
(setq undo-strong-limit 40000000)
(setq compilation-directory-locked nil)
(scroll-bar-mode 0)
(tool-bar-mode 0)

(column-number-mode t)
(cua-mode t)
(ido-mode t) ;; (die geile Sache) mit dem das man die Verzeichnisse usw. angezeigt bekommt.

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq mouse-wheel-scroll-amount '(2 ((shift) . 2))) ;; one line at a time

(setq next-line-add-newline t)
(add-hook 'prog-mode-hook 'highlight-numbers-mode)

;; der jai mode wird geladen (endlich).
(add-to-list 'load-path "~/.emacs.d/modes/")
(load "jai") 

;; jonathan blow's thema 
(set-face-attribute 'font-lock-builtin-face nil :foreground "white smoke")
(set-face-attribute 'font-lock-keyword-face nil :foreground "white smoke")
(set-face-attribute 'font-lock-string-face nil :foreground "dark gray")
(set-face-attribute 'font-lock-comment-face nil :foreground "yellow")
(set-face-attribute 'font-lock-doc-face nil :foreground "yellow")
(set-face-attribute 'font-lock-constant-face nil :foreground "#7CE656")
(set-face-attribute 'font-lock-type-face nil :foreground "#86FF5B")
(set-face-attribute 'font-lock-function-name-face nil :foreground "white smoke")
(set-face-attribute 'font-lock-preprocessor-face nil :foreground "#86FF5B")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "#D5A05A")

;;(load-theme 'spolsky) 
(set-face-attribute 'region nil :background "medium blue")
(set-face-attribute 'region nil :foreground "#D5A05A")
(set-face-background 'mode-line "tan2")
(set-face-foreground 'mode-line "black")

;;moe theme
;; (set-face-attribute 'font-lock-builtin-face nil :foreground "#c678dd")
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "#a1db00")
;; (set-face-attribute 'font-lock-string-face nil :foreground "#ff1f8b")
;; (set-face-attribute 'font-lock-comment-face nil :foreground "#6c6c6c")
;; (set-face-attribute 'font-lock-doc-face nil :foreground "#6c6c6c")
;; (set-face-attribute 'font-lock-constant-face nil :foreground "#1f5bff")
;; (set-face-attribute 'font-lock-type-face nil :foreground "#00d7af")
;; (set-face-attribute 'font-lock-function-name-face nil :foreground "#ffd700")
;; (set-face-attribute 'font-lock-preprocessor-face nil :foreground "#c678dd")
;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "#ff8700")

;; burlywood thema
;; (set-face-attribute 'font-lock-builtin-face nil :foreground "tan2")
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "tan2")
;; (set-face-attribute 'font-lock-string-face nil :foreground "#burlywood2")
;; (set-face-attribute 'font-lock-comment-face nil :foreground "burlywood4")
;; (set-face-attribute 'font-lock-doc-face nil :foreground "burlywood4")
;; (set-face-attribute 'font-lock-constant-face nil :foreground "tan2")
;; (set-face-attribute 'font-lock-type-face nil :foreground "#D5A05A")
;; (set-face-attribute 'font-lock-function-name-face nil :foreground "#D5A05A")
;; (set-face-attribute 'font-lock-preprocessor-face nil :foreground "tan2")
;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "#D5A05A")

;; hier die sache mit dem "berry" thema:
;; (set-face-attribute 'font-lock-builtin-face nil :foreground "brown2")
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "brown2")
;; (set-face-attribute 'font-lock-string-face nil :foreground "IndianRed2")
;; (set-face-attribute 'font-lock-comment-face nil :foreground "yellow1")
;; (set-face-attribute 'font-lock-doc-face nil :foreground "yellow")
;; (set-face-attribute 'font-lock-constant-face nil :foreground "#7CE656")
;; (set-face-attribute 'font-lock-type-face nil :foreground "#7CE656")
;; (set-face-attribute 'font-lock-function-name-face nil :foreground "white smoke")
;; (set-face-attribute 'font-lock-preprocessor-face nil :foreground "#D5A05A")
;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "#D5A05A")

;; (require 'powerline)
;; (powerline-default-theme)
;; (set-face-attribute 'mode-line nil
;;                     :foreground "Black"
;;                     :background "dim gray"
;;                     :box nil)


;;(setq-default cursor-type 'bar) ;; hiermit kann man den cursor zu einem dünnen strich machen.

;; default vim thema: 
;; (set-face-attribute 'font-lock-builtin-face nil :foreground "purple")
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "#a52a2a" :bold t)
;; (set-face-attribute 'font-lock-string-face nil :foreground "#ff00ff")
;; (set-face-attribute 'font-lock-comment-face nil :foreground "gray40")
;; (set-face-attribute 'font-lock-doc-face nil :foreground "gray40")
;; (set-face-attribute 'font-lock-constant-face nil :foreground "green4")
;; (set-face-attribute 'font-lock-type-face nil :foreground "ForestGreen" :bold t)
;; (set-face-attribute 'font-lock-function-name-face nil :foreground "008b8b")
;; (set-face-attribute 'font-lock-preprocessor-face nil :foreground "purple")
;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "#008b8b")


;; casey's thema
;;(add-to-list 'default-frame-alist '(font . "Liberation Mono-11.5"))
;; (set-face-attribute 'default t :font "Liberation Mono-11.5")
;; (set-face-attribute 'font-lock-builtin-face nil :foreground "#DAB98F")
;; (set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
;; (set-face-attribute 'font-lock-constant-face nil :foreground "olive drab")
;; (set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
;; (set-face-attribute 'font-lock-function-name-face nil :foreground "burlywood3")
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "DarkGoldenrod3")
;; (set-face-attribute 'font-lock-string-face nil :foreground "olive drab")
;; (set-face-attribute 'font-lock-type-face nil :foreground "burlywood3")
;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "burlywood3")

;;atom theme
;; (set-face-attribute 'font-lock-builtin-face nil :foreground "#c678dd")
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "#c678dd")
;; (set-face-attribute 'font-lock-string-face nil :foreground "#98c379")
;; (set-face-attribute 'font-lock-comment-face nil :foreground "#5C6370")
;; (set-face-attribute 'font-lock-doc-face nil :foreground "#5C6370")
;; (set-face-attribute 'font-lock-constant-face nil :foreground "#d19a66")
;; (set-face-attribute 'font-lock-type-face nil :foreground "#CFCB90")
;; (set-face-attribute 'font-lock-function-name-face nil :foreground "#61afef")
;; (set-face-attribute 'font-lock-preprocessor-face nil :foreground "#8996A8")
;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "#e5c07b")

;;und hier die Sachen mit dem Visual Studio Thema
;; (set-face-attribute 'font-lock-builtin-face nil :foreground "#81a2be")
;; (set-face-attribute 'font-lock-keyword-face nil :foreground "#81a2be")
;; (set-face-attribute 'font-lock-string-face nil :foreground "#cc6666")
;; (set-face-attribute 'font-lock-comment-face nil :foreground "#b5bd68")
;; (set-face-attribute 'font-lock-doc-face nil :foreground "#b5bd68")
;; (set-face-attribute 'font-lock-constant-face nil :foreground "#86FF5B") ;; ist jetzt mit dem type face vertauscht.
;; (set-face-attribute 'font-lock-type-face nil :foreground "#7CE656")
;; (set-face-attribute 'font-lock-function-name-face nil :foreground "#61afef")
;; (set-face-attribute 'font-lock-preprocessor-face nil :foreground "#c678dd")
;; (set-face-attribute 'font-lock-variable-name-face nil :foreground "#CFCB90")

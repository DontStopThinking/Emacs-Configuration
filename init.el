; Emacs startup setup
(defun shantanu-startup-setup ()
  ; disable annoying beep sound
  (setq ring-bell-function 'ignore)
  ; Disable backup files
  (setq make-backup-files nil)
  (setq-default truncate-lines t)
  (setq truncate-partial-width-windows nil)
  (split-window-horizontally)
  (scroll-bar-mode -1)
  (menu-bar-mode -1)
  (toggle-frame-maximized)
  (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
  (load-theme 'default-black t)
  (set-face-attribute 'default nil :family "Liberation Mono"))

; Coding style
(defun shantanu-set-coding-style ()
  (setq c-default-style "stroustrup"))

(shantanu-startup-setup)
(shantanu-set-coding-style)

; add the themes directory to custom themes load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

; add the packages directory to load path
(add-to-list 'load-path "~/.emacs.d/packages")

(if (window-system)
  (set-frame-size (selected-frame) 70 30))

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(unless (package-installed-p 'dart-mode)
  (package-refresh-contents)
  (package-install 'dart-mode))

; enable htmlize
(require 'htmlize)

; enable winner mode
(winner-mode 1)

; disable line wrapping
(set-default 'truncate-lines t)

; disable backup files
(setq make-backup-files nil)

; set theme
(load-theme 'default-black t)

; disable the splash screen on startup
; (setq inhibit-startup-screen t)

;; Set default font
(set-face-attribute 'default nil
                    :family "Cascadia code"
                    :height 110
                    :weight 'normal
                    :width 'normal)

; disable annoying beep sound
(setq ring-bell-function 'ignore)

; start maximized
;(add-hook 'window-setup-hook 'toggle-frame-maximized t)

; disable toolbar
(tool-bar-mode -1)

; enable line numbers
(global-display-line-numbers-mode)

; split window on startup
;(split-window-horizontally)

;--------- Keybindings -----------

;--------- Keybindings -----------

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
	("9527feeeec43970b1d725bdc04e97eb2b03b15be982ac50089ad223d3c6f2920" default)))
 '(package-selected-packages (quote (dart-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'erase-buffer 'disabled nil)

; add the themes directory to custom themes load path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

; add the packages directory to load path
(add-to-list 'load-path "~/.emacs.d/packages")

;(if (window-system)
;  (set-frame-size (selected-frame) 70 30))

(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(load-library "view")
(require 'cc-mode)
(require 'ido)
(require 'compile)
(ido-mode t)

; Disable automatic file search in ido mode
(setq ido-auto-merge-work-directories-length -1)

; Disable line highlight b/w mark and cursor
(setq transient-mark-mode nil)

; Disable line wrapping
(set-default 'truncate-lines t)

; Disable backup files
(setq make-backup-files nil)

; Set theme
;(load-theme 'default-black t)

; Disable the splash screen on startup
; (setq inhibit-startup-screen t)

; disable annoying beep sound
(setq ring-bell-function 'ignore)

; start maximized
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

; Turn off the toolbar
(tool-bar-mode 0)

; Turn off scrollbar
(toggle-scroll-bar -1)

; Enable line numbers
(global-display-line-numbers-mode)

; Clock
(display-time)

; Startup windowing
(setq next-line-add-newlines nil)
(setq-default truncate-lines t)
(setq truncate-partial-width-windows nil)
(split-window-horizontally)

(global-hl-line-mode 1)
(set-face-background 'hl-line "midnight blue")

;;;;;;;;;; C-C++ mode handling;;;;;;;;

; C++ indentation style
(defconst casey-big-fun-c-style
  '((c-electric-pound-behavior   . nil)
    (c-tab-always-indent         . t)
    (c-comment-only-line-offset  . 0)
    (c-hanging-braces-alist      . ((class-open)
                                    (class-close)
                                    (defun-open)
                                    (defun-close)
                                    (inline-open)
                                    (inline-close)
                                    (brace-list-open)
                                    (brace-list-close)
                                    (brace-list-intro)
                                    (brace-list-entry)
                                    (block-open)
                                    (block-close)
                                    (substatement-open)
                                    (statement-case-open)
                                    (class-open)))
    (c-hanging-colons-alist      . ((inher-intro)
                                    (case-label)
                                    (label)
                                    (access-label)
                                    (access-key)
                                    (member-init-intro)))
    (c-cleanup-list              . (scope-operator
                                    list-close-comma
                                    defun-close-semi))
    (c-offsets-alist             . ((arglist-close         .  c-lineup-arglist)
                                    (label                 . -4)
                                    (access-label          . -4)
                                    (substatement-open     .  0)
                                    (statement-case-intro  .  4)
                                    (statement-block-intro .  c-lineup-for)
                                    (case-label            .  4)
                                    (block-open            .  0)
                                    (inline-open           .  0)
                                    (topmost-intro-cont    .  0)
                                    (knr-argdecl-intro     . -4)
                                    (brace-list-open       .  0)
                                    (brace-list-intro      .  4)))
    (c-echo-syntactic-information-p . t))
    "Casey's Big Fun C++ Style")


; CC++ mode handling
(defun casey-big-fun-c-hook ()
  ; Set my style for the current buffer
  (c-add-style "BigFun" casey-big-fun-c-style t)
  
  ; 4-space tabs
  (setq tab-width 4
        indent-tabs-mode nil)

  ; Additional style stuff
  (c-set-offset 'member-init-intro '++)

  ; No hungry backspace
  (c-toggle-auto-hungry-state -1)
)

(add-hook 'c-mode-common-hook 'casey-big-fun-c-hook)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;; Functions ;;;;;;;;;;;;;;

; Determine the underlying operating system
(setq casey-aquamacs (featurep 'aquamacs))
(setq casey-linux (featurep 'x))
(setq casey-win32 (not (or casey-aquamacs casey-linux)))

(defun maximize-frame ()
    "Maximize the current frame"
     (interactive)
     (when casey-aquamacs (aquamacs-toggle-full-frame))
     (when casey-win32 (w32-send-sys-command 61488)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;; Keybindings ;;;;;;;;;;;;

; Setup my find-files
(define-key global-map "\ef" 'find-file)
(define-key global-map "\eF" 'find-file-other-window)

(define-key global-map [M-up] 'backward-paragraph)
(define-key global-map [M-down] 'forward-paragraph)
(define-key global-map [M-right] 'forward-word)
(define-key global-map [M-left] 'backward-word)
(define-key global-map [pgup] 'forward-page)
(define-key global-map [pgdown] 'backward-page)
(define-key global-map [C-next] 'scroll-other-window)
(define-key global-map [C-prior] 'scroll-other-window-down)

(global-set-key (read-kbd-macro "\eb")  'ido-switch-buffer)
(global-set-key (read-kbd-macro "\eB")  'ido-switch-buffer-other-window)

(define-key global-map "\ep" 'maximize-frame)
(define-key global-map "\ew" 'other-window)
(define-key global-map [C-right] 'forward-word)
(define-key global-map [C-left] 'backward-word)
(define-key global-map "\t" 'dabbrev-expand)
(define-key global-map [C-tab] 'indent-region)

(define-key global-map "\e:" 'View-back-to-mark)
(define-key global-map "\e;" 'exchange-point-and-mark)

(define-key global-map "\eu" 'undo)

; Buffers
(define-key global-map "\er" 'revert-buffer)
(define-key global-map "\ek" 'kill-this-buffer)
(define-key global-map "\es" 'save-buffer)

; Editing
(global-set-key (kbd "C-q") 'yank)           ; paste block
(global-set-key (kbd "C-f") 'kill-ring-save) ; copy block
(global-set-key (kbd "C-w") 'kill-region)    ; cut block
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;;;;; Handmade Hero Theme ;;;;;;;;;;;;;

(add-to-list 'default-frame-alist '(font . "Cascadia Code-11"))
(set-face-attribute 'default t :font "Cascadia Code-11")
(set-face-attribute 'font-lock-builtin-face nil :foreground "#DAB98F")
(set-face-attribute 'font-lock-comment-face nil :foreground "gray50")
(set-face-attribute 'font-lock-constant-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-doc-face nil :foreground "gray50")
(set-face-attribute 'font-lock-function-name-face nil :foreground "burlywood3")
(set-face-attribute 'font-lock-keyword-face nil :foreground "DarkGoldenrod3")
(set-face-attribute 'font-lock-string-face nil :foreground "olive drab")
(set-face-attribute 'font-lock-type-face nil :foreground "burlywood3")
(set-face-attribute 'font-lock-variable-name-face nil :foreground "burlywood3")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun post-load-stuff ()
  (interactive)
  (menu-bar-mode -1)
  (maximize-frame)
  (set-foreground-color "burlywood3")
  (set-background-color "#161616")
  (set-cursor-color "#40FF40")
)
(add-hook 'window-setup-hook 'post-load-stuff t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("9527feeeec43970b1d725bdc04e97eb2b03b15be982ac50089ad223d3c6f2920" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

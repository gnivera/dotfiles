;;                  __               ___
;;   __          __/\ \__           /\_ \
;;  /\_\    ___ /\_\ \ ,_\        __\//\ \
;;  \/\ \ /' _ `\/\ \ \ \/      /'__`\\ \ \
;;   \ \ \/\ \/\ \ \ \ \ \_  __/\  __/ \_\ \_
;;    \ \_\ \_\ \_\ \_\ \__\/\_\ \____\/\____\
;;     \/_/\/_/\/_/\/_/\/__/\/_/\/____/\/____/

;; pacakge setings
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives  '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(package-initialize)

(ivy-mode 1)

;; ido
(ido-mode 1)
(ido-everywhere 1)
(setq ido-enable-flex-matching t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)
(setq inhibit-startup-message 1)

(set-frame-parameter (selected-frame) 'alpha '(80 . 80))
(add-to-list 'default-frame-alist '(alpha . (80 . 80)))
(load-theme 'manoj-dark t)
(global-font-lock-mode t)
(add-to-list 'default-frame-alist '(font . "monaco-13"))
(setq default-directory "~/dropbox" )

(setq org-startup-indented t)
(setq org-indent-mode-turns-on-hiding-stars nil)
(setq org-indent-indentation-per-level 4)
(setq org-startup-folded 'content)

;; swiper
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c u") 'swiper-all)

;; dashboard
(require 'dashboard)
(dashboard-setup-startup-hook)

;; org-capture
(setq org-capture-templates
      '(("t" "Think" entry (file "~/Dropbox/doc/THINK.org")
        "* %?\n  %i\n %U ")
       ("p" "Tips" entry (file "~/Dropbox/doc/TIPS.org")
        "* %i %i %U ")
       ("m" "Poem" entry (file "~/Dropbox/doc/poem.org")
        "* %i %i %U ")))
(global-set-key (kbd "C-c c") 'org-capture)

;; ido-vertical-mode
(require 'ido-vertical-mode)
(ido-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; show line number
(global-display-line-numbers-mode)

(setq scroll-conservatively 35
  scroll-margin 0
  scroll-step 1)

;; don't create backup/auto save file
(setq make-backup-files nil)
(setq auto-save-default nil)

;; permanently commands History
(setq desktop-globals-to-save '(extended-command-history))
(setq desktop-files-not-to-save "")
(desktop-save-mode 1)

;; org-download
(require 'org-download)
(setq-default org-download-image-dir "~/Dropbox/doc/images")
(add-hook 'dired-mode-hook 'org-download-enable)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (speed-type swiper dashboard ido-vertical-mode magit neotree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

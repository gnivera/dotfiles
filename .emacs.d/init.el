;;                  __               ___
;;   __          __/\ \__           /\_ \
;;  /\_\    ___ /\_\ \ ,_\        __\//\ \
;;  \/\ \ /' _ `\/\ \ \ \/      /'__`\\ \ \
;;   \ \ \/\ \/\ \ \ \ \ \_  __/\  __/ \_\ \_
;;    \ \_\ \_\ \_\ \_\ \__\/\_\ \____\/\____\
;;     \/_/\/_/\/_/\/_/\/__/\/_/\/____/\/____/

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)
(setq inhibit-startup-message 1)

(set-frame-parameter (selected-frame) 'alpha '(80 . 80))
(add-to-list 'default-frame-alist '(alpha . (80 . 80)))

(load-theme 'misterioso t)
(global-font-lock-mode t)
(add-to-list 'default-frame-alist '(font . "monaco-14"))

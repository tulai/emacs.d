;;(add-to-list 'load-path "~/.emacs.d/el-get")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require 'el-get)

;;Set custom theme path
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

;;Set default theme to Flatland
(load-theme 'flatland t)

;;display line number
(global-linum-mode t)

;;Set my own font config
(add-to-list 'load-path "~/.emacs.d/lisp/fonts")
(require 'tl-fonts)

;;auto pair bracket and quotes
(add-to-list 'load-path "~/.emacs.d/el-get/autopair") 
;; comment if autopair.el is in standard load path 
(require 'autopair)
(autopair-global-mode) ;; enable autopair in all buffers 
;; use autopair just in c buffers 
;;(add-hook 'c-mode-common-hook '(lambda () (autopair-mode)))

(require 'ido)(ido-mode t)

;;Set autocomplete 
(add-to-list 'load-path "~/.emacs.d/el-get/popup")
(require 'popup)
(add-to-list 'load-path "~/.emacs.d/el-get/fuzzy")
(require 'fuzzy)
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete")
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;;Set reftex
(add-to-list 'load-path "~/.emacs.d/el-get/reftex")
(require 'reftex)

;;Set yasnippet
(add-to-list 'load-path "~/.emacs.d/el-get/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas-global-mode 1)

;;Set Auto-complete-yasnippet
(add-to-list 'load-path "~/.emacs.d/el-get/auto-complete-yasnippet")
(require 'auto-complete-yasnippet)

;; fix some org-mode + yasnippet conflicts:
(defun yas/org-very-safe-expand ()
  (let ((yas/fallback-behavior 'return-nil)) (yas/expand)))

;;Set my own org-mode
(add-to-list 'load-path "~/.emacs.d/lisp/org-mode")
(require 'tl-org-mode)


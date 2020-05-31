(package-initialize)

(setenv "HOME" "G:/emacs/")

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
;; Package Management
;; -----------------------------------------------------------------
(require 'init-packages)

(require 'init-ui)

(require 'init-better-defaults)

(require 'init-keybindings)

(require 'init-org)

(require 'init-scheme)

(require 'fun-lib)
;; Find Executable Path on OS X
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;; (defconst *spell-check-support-enabled* t) ;; Enable with t if you prefer
;; (add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(defconst *is-a-mac* (eq system-type 'darwin))

(defun fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
		       (if (frame-parameter nil 'fullscreen) nil 'fullboth)))

(fullscreen)

;;设置括号颜色
(use-package parenface
  :config
  (set-face-foreground 'paren-face "DimGray")
  )

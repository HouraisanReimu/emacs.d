(defvar best-gc-cons-threshold
  4000000
  "Best default gc threshold value.  Should NOT be too big!")

;; don't GC during startup to save time
(setq gc-cons-threshold most-positive-fixnum)

(setq emacs-load-start-time (current-time))

;; {{ emergency security fix
;; https://bugs.debian.org/766397
(with-eval-after-load 'enriched
  (defun enriched-decode-display-prop (start end &optional param)
    (list start end)))


(package-initialize)

;; (setenv "HOME" "G:/emacs/")
(defvar PortableHome (substring data-directory 0 3))
(defvar usb-home-dir (concat PortableHome "emacs/"))
(setenv "HOME" usb-home-dir)
;;(setenv "PATH" "%PATH%")

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

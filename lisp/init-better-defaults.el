;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;; 快速打开键位配置文件
(defun open-kbd-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-keybindings.el"))

;; 快速打开键位配置文件
(defun open-pkg-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-packages.el"))

;;配对括号高亮
;; (define-advice show-paren-function (:around (fn) fix-show-paren-function)
;;   "Highlight enclosing parens."
;;   (cond ((looking-at-p "\\s(") (funcall fn))
;; 	(t (save-excursion
;; 	     (ignore-errors (backward-up-list))
	     ;; (funcall fn)))))
;; (show-paren-mode 1)

;;自动补全
(global-company-mode 1)
(add-hook 'after-init-hook 'global-company-mode)

(delete-selection-mode 1)

;;自动加载外部修改过的文件
(global-auto-revert-mode 1)

;; 将 (yes or no) 简化为 (y or n)
(fset 'yes-or-no-p 'y-or-n-p)

;;关闭 Emacs 警告音
(setq ring-bell-function 'ignore)

;;Hippie Expand补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

;;Dired Mode重用唯一缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))


(prefer-coding-system 'utf-8) 

(set-language-environment "UTF-8")

(provide 'init-better-defaults)

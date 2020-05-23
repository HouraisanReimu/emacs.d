(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			 ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		window-numbering
		popwin
		ripgrep
		evil
		which-key
		use-package
		;; --- Major Mode ---
		js2-mode
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
		;; solarized-theme	       	
		) "Default packages")
;;安装
 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

;;载入包
;;打开最近的文件
(use-package recentf 
  :config
  (progn
    (recentf-mode 1)
    (setq recentf-max-menu-items 25)
    (setq recentf-max-saved-items 25)
    )
  )

;;set windows numbering
(use-package window-numbering
	     :config
	     (window-numbering-mode 1)
	     )

;;popwin 插件可以自动将光标移动到，新创建的窗口中
(use-package popwin
	     :config
	     (popwin-mode 1)
	     )

;;evil启动
(use-package evil
	     :config
	     (evil-mode 1)
	     )

;;每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径。
(use-package dired-x)

;; 文件末尾
(provide 'init-packages)

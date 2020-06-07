(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(;;("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ;;("melpa" . "http://elpa.emacs-china.org/melpa/")
			   ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			   ("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			   ("melpa-stable" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa-stable/"))))

;; cl - Common Lisp Extension
(require 'cl)

;; Add Packages
(defvar my/packages '(
		      ;; --- Auto-completion ---
		      ;;company
		      auto-complete
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
		      evil-leader
		      evil-nerd-commenter
		      which-key
		      paredit
			  ;;mic-paren
		      ;; --- Major Mode ---
		      ;;js2-mode
		      ;; --- Minor Mode ---
		      ;;nodejs-repl
		      exec-path-from-shell
		      ;; --- Themes ---
		      monokai-theme
		      ;; solarized-theme	       	
		      ;; --- Org Mode --
		      org
		      org-roam
		      org-journal
		      org-bullets
		      ;; --- backend ---
		      ;;emacsql-sqlite3
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

;;leader键启动
(global-evil-leader-mode)

;;evil启动
(use-package evil
  :config
  (evil-mode 1)
  )

;; ;;快捷注释插件启动，The hotkey is “,cl” in evil-mode and “M-;” in all modes. “M” means ALT key.
(evilnc-default-hotkeys)

;; 显示当前有哪些可用快捷键
(which-key-mode 1)

;; scheme编程环境
;; ParEdit mode 是一个很特殊的模式。它起作用的时候，你不能直接修改括号。这样所有的括号都保持完整的匹配，不可能出现语法错误。但是这样有一个问题，如果你要把一块代码放进另一块代码，或者从里面拿出来，就不是很方便了。

;; 为此，ParEdit mode 提供了几个非常高效的编辑方式。我平时只使用两个：

;; C-right: 也就是按住 Ctrl 再按右箭头。它的作用是让光标右边的括号，“吞掉”下一个S表达式。

;; 比如，`(a b c) (d e)`。你把光标放在 `(a b c)` 里面，然后按 `C-right`。结果就是 `(a b c (d e))`。也就是把 `(d e)` 被整个“吞进”了 `(a b c)` 里面。 
;; M-r: 去掉外层代码。

;; 这在你需要去掉外层的 let 等结构的时候非常有用。比如，如果你的代码看起来是这样：

;; (let ([x 10])
;;   (* x 2))
;; 当你把光标放在 (* x 2) 的最左边，然后按 M-r，结果就变成了

;; (* x 2)
;; 也就是把外面的 (let ([x 10]) ...) 给“掀掉”了。

;; 其它的一些按键虽然也有用，不过我觉得这两个是最有用的，甚至不可缺少的。有些其他的自动匹配括号的模式，没有提供这种按键，所以用起来很别扭。
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code."
  t)

;;每一次进入 Dired 模式时，使用新的快捷键 C-x C-j 就可以进 入当前文件夹的所在的路径。
(use-package dired-x)

;;启动括号高亮匹配
;; (require 'highlight-parentheses)
;; (highlight-parentheses-mode 1)

;;(paren-activate) ;; activates mic-paren
;;(setq paren-highlight-offscreen t) 

;; 文件末尾
(provide 'init-packages)

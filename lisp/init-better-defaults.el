;;括号补全
(electric-pair-mode t)
;;配对括号高亮
(show-paren-mode 1)
;;在括号内显示目前所在括号
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))



;;自动补全
(global-auto-complete-mode 1)
;;(global-company-mode 1)
;;(add-hook 'after-init-hook 'global-company-mode)

;; 图片显示
(auto-image-file-mode t) 


(delete-selection-mode 1)

;;自动加载外部修改过的文件
(global-auto-revert-mode 1)

;;打开上次退出时打开的文件
;;(desktop-save-mode 1)
;;忽略是否加载的提问
;;(setq desktop-load-locked-desktop t)

;;打开上次的文件记录

;; (load "desktop") 

;; (desktop-load-default)

;; (desktop-read)

;;当emacs退出时保存文件打开状态

;; (add-hook 'kill-emacs-hook

;;           '(lambda()(desktop-save "~/")))


;; 将 (yes or no) 简化为 (y or n)
(fset 'yes-or-no-p 'y-or-n-p)

;;关闭 Emacs 警告音
(setq ring-bell-function 'ignore)

;;Hippie Expand补全
;;(setq hippie-expand-try-function-list '(try-expand-debbrev
;;					try-expand-debbrev-all-buffers
;;					try-expand-debbrev-from-kill
;;					try-complete-file-name-partially
;;					try-complete-file-name
;;					try-expand-all-abbrevs
;;					try-expand-list
;;					try-expand-line
;;					try-complete-lisp-symbol-partially
;;					try-complete-lisp-symbol))

;;Dired Mode重用唯一缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(prefer-coding-system 'utf-8) 

;; 启动cnfonts
;;(cnfonts-enable)

;; Setting English Font
(set-face-attribute
  'default nil :font "Consolas 14")

(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :name "-outline-新宋体-normal-normal-normal-mono-*-*-*-*-c-*-iso10646-1"
              :weight 'normal
              :slant 'normal
              :size 16.0)))

(setq face-font-rescale-alist '("新宋体" . 1.2))

;; Chinese Font
;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font (frame-parameter nil 'font)
;;                       charset
;;                       (font-spec :family "Sarasa Mono CL" :size 16)))

;;设置终端编码为utf-8
(set-terminal-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(setq default-process-coding-system '(utf-8 . utf-8))

;;设置默认编码为utf-8
(set-language-environment "UTF-8")
;;解决换成UTF-8后很卡的问题，来自https://emacs.stackexchange.com/questions/33510/unicode-txt-slowness
(setq inhibit-compacting-font-caches t)

(provide 'init-better-defaults)

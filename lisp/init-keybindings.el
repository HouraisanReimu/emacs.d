;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; 最近打开的文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;Hippie Expand
(global-set-key (kbd "s-/") 'hippie-expand)

;;全局搜索
(global-set-key (kbd "\C-q") 'ripgrep-regexp)

(provide 'init-keybindings)

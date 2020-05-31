;; 这一行代码，将函数 open-init-file 绑定到 <f2> 键上
(global-set-key (kbd "<f2>") 'open-init-file)

;; 这一行代码，将函数 open-kgb-file 绑定到 <f2> 键上
(global-set-key (kbd "<f3>") 'open-kbd-file) 

;; 这一行代码，将函数 open-pkg-file 绑定到 <f2> 键上
(global-set-key (kbd "<f4>") 'open-pkg-file) 

;; 这一行代码，将函数 open-def-file 绑定到 <f2> 键上
;;(global-set-key (kbd "<f5>") 'open-def-file) 

;; 最近打开的文件
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;;Hippie Expand
(global-set-key (kbd "s-/") 'hippie-expand)

;;全局搜索
(global-set-key (kbd "\C-q") 'ripgrep-regexp)

;;evil，leader键设置，默认的leader键是\
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'delete-other-windows
  ;; "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "lb" 'open-lib-file 
  ;; "wM" 'delete-other-windows
  )

;; (define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
;; (define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

(provide 'init-keybindings)

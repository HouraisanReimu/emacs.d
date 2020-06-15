(require 'org)
(setq org-src-fontify-natively t)

(setq org-todo-keywords
      '((sequence "未开始(p!)" "进行中(t!)" "阻塞中(s!)" "|" "已完成(d!)" "已取消(a!)")))

;; 设置任务流程
;; (setq org-todo-keywords
      ;; '((sequence "未开始" "进行中(t!)" "阻塞中" "|" "已完成" "已取消")))
;; 设置任务样式
(setq org-todo-keyword-faces
   '(("未开始" .   (:foreground "red" :weight bold))
    ("阻塞中" .   (:foreground "red" :weight bold))
    ;; ("进行中" .      (:foreground "orange" :weight bold))
    ("已完成" .      (:foreground "green" :weight bold))
    ;; ("已取消" .     (:background "gray")) 
    ("已取消" .     (:foreground "gray"))
))

;; 设置 Org Agenda 快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; 加入到日程列表里
(setq org-agenda-files (list "~/org/日程/门诊工作量日程.org"))

(use-package org-journal
  :ensure t
  :config
  (setq org-journal-dir "~/org/org-journal/"
        org-journal-date-format "%Y-%m-%d,%A"
	org-journal-file-format "%Y-%m-%d,%A.org"))

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))
;;org-roam 反向链接
(use-package org-roam
      ;;:hook
      ;;(after-init . org-roam-mode)
      :custom
      (org-roam-directory "~/org/org-roam/")
      :bind (:map org-roam-mode-map
              (("C-c n l" . org-roam)
               ("C-c n f" . org-roam-find-file)
               ("C-c n g" . org-roam-show-graph))
              :map org-mode-map
              (("C-c n i" . org-roam-insert)))
      :config
      (add-hook 'after-init-hook 'org-roam-mode)
      )

(provide 'init-org)

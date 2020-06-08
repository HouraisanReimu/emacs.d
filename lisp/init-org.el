(require 'org)
(setq org-src-fontify-natively t)

(use-package org-journal
  :ensure t
  :config
  (setq org-journal-dir "~/org/org-roam/"
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

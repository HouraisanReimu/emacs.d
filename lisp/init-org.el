(require 'org)
(setq org-src-fontify-natively t)

(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(provide 'init-org)

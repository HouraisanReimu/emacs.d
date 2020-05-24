;; 在行首行尾添加字符
(defun datalength()
  (interactive)
  (mark-whole-buffer)
  (replace-regexp "^" "se" nil 1 (point-max))
  (replace-regexp "$" "lll" nil 1 (point-max)))

(provide 'fun-lib)

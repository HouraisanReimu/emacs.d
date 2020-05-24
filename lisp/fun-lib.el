;; 在行首行尾添加字符
(defun datalength()
  (interactive)
  (mark-whole-buffer)
  (replace-regexp "^" "se" nil 1 (point-max))
  (replace-regexp "$" "lll" nil 1 (point-max)))

;;快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;快速打开键位配置文件
(defun open-kbd-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-keybindings.el"))

;;快速打开包配置文件
(defun open-pkg-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-packages.el"))

;;快速打开编辑器配置文件
(defun open-def-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/init-better-defaults.el"))

;;快速打开编辑器配置文件
(defun open-lib-file()
  (interactive)
  (find-file "~/.emacs.d/lisp/fun-lib.el")) 

;;格式化缓冲区
(defun indent-buffer ()
  "Indent the whole buffer."
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))

(provide 'fun-lib)

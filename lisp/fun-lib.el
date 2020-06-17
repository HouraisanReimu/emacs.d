;; 在行首行尾添加字符
(defun datalength()
  (interactive)
  (mark-whole-buffer)
  (replace-regexp "^" "se" nil 1 (point-max))
  (replace-regexp "$" "lll" nil 1 (point-max)))

;; 插入当前时间
;;(defun now ()
;;(interactive)
;;( insert (current-time-string)))

;; ====================
;; insert date and time

(defvar current-date-time-format "%Y-%m-%d %H:%M:%S"
  "Format of date to insert with `insert-current-date-time' func
See help of `format-time-string' for possible replacements")

(defvar current-time-format "%H:%M:%S"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defvar current-date-format "%Y-%m-%d"
  "Format of date to insert with `insert-current-time' func.
Note the weekly scope of the command's precision.")

(defun insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `current-date-time-format' for the formatting the date/time."
       (interactive)
       ;; (insert "==========\n")
      ;; (insert (let () (comment-start)))
       (insert (format-time-string current-date-time-format (current-time)))
       ;; (insert "\n")
       )

(defun insert-current-date ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-date-format (current-time)))
       ;; (insert "\n")
       )
(defun insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
       (interactive)
       (insert (format-time-string current-time-format (current-time)))
       ;; (insert "\n")
       )

;; (global-set-key "\C-c\C-d" 'insert-current-date-time)
;; (global-set-key "\C-c\C-t" 'insert-current-time)

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

;; 在org-mode里显示图片
(defun org-toggle-iimage-in-org ()
  "display images in your org file"
  (interactive)
  (if (face-underline-p 'org-link)
      (set-face-underline-p 'org-link nil)
      (set-face-underline-p 'org-link t))
  (iimage-mode))

(provide 'fun-lib)

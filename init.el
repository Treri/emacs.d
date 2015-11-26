;; show line number
(global-linum-mode)
;; use customized linum-format: add a addition space after the line number
(unless window-system
  (add-hook 'linum-before-numbering-hook
      (lambda ()
        (setq-local linum-format-fmt
        (let ((w (length (number-to-string
              (count-lines (point-min) (point-max))))))
          (concat "%" (number-to-string w) "d"))))))
(defun linum-format-func (line)
  (concat
   (propertize (format linum-format-fmt line) 'face 'linum)
   (propertize " " 'face 'linum-padding-right)))
(unless window-system
  (setq linum-format 'linum-format-func))

;; Use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; Wrap long lines
(global-visual-line-mode)

;; Prevent the cursor from blinking
(blink-cursor-mode 0)
;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)
;; Don't let Emacs hurt your ears
(setq visible-bell t)

;; Who use the bar to scroll?
(scroll-bar-mode 0)
;; Don't show tool bar and menu bar
(tool-bar-mode 0)
(menu-bar-mode 0)

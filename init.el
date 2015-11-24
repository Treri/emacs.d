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

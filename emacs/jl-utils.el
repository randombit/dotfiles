;; Emacs -*- mode: Lisp -*- code

(defun first-true (pred lst)
  (cond ((null lst) nil)
        ((funcall pred (car lst)) (car lst))
        (t (first-true pred (cdr lst)))))

(defun filter (pred lst)
  (let (result)
    (nreverse (dolist (elt lst result)
      (if (funcall pred elt)
          (setq result (cons elt result)))))))

; From e2
(defun create-scratch-buffer nil
  "create a new scratch buffer to work in. (could be *scratch* - *scratchX*)"
  (interactive)
  (let ((n 0)
        bufname)
    (while (progn
             (setq bufname (concat "*scratch"
                                   (if (= n 0) "" (int-to-string n))
                                   "*"))
             (setq n (1+ n))
             (get-buffer bufname)))
    (switch-to-buffer (get-buffer-create bufname))
    (if (= n 1) (lisp-interaction-mode)) ; 1, because n was incremented
    ))

(defun clear-buffer()
  "Kill all text in current buffer"
  (interactive)
  (clipboard-kill-region 1 (point-max))
  (begining-of-buffer))

(defun indent-buffer ()
  "Indents an entire buffer using the default intenting scheme."
  (interactive)
  (save-excursion
    (delete-trailing-whitespace)
    (indent-region (point-min) (point-max) nil)
    (untabify (point-min) (point-max))))

(global-set-key "\C-x\\" 'indent-buffer)

(defun unfill-paragraph ()
   "Takes a multi-line paragraph and makes it into a single line of text."
   (interactive)
   (let ((fill-column (point-max)))
     (fill-paragraph nil)))

(define-key global-map "\M-Q" 'unfill-paragraph)

(defun toggle-trailing-whitespace-display ()
  "Toggle the display of trailing whitespace"
  (interactive)
  (save-excursion
    (setq show-trailing-whitespace
          (not show-trailing-whitespace))
    (redraw-display))
  (message (concat "Display of EOL spaces "
                   (if show-trailing-whitespace
                       "enabled" "disabled"))))
(global-set-key "\C-ce" 'toggle-trailing-whitespace-display)


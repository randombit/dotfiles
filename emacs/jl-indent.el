;; Emacs -*- mode: Lisp -*- code

(setq botan-style '(
   (c-basic-offset . 3)
   (c-comment-only-line-offset . 0)
   (c-offsets-alist
;      (c . c-lineup-C-comments)
;      (comment-intro . c-lineup-comment)

      (c . 0)
      (comment-intro . 0)

      (statement-block-intro . 0)
      (statement-cont . +)

      (substatement . +)
      (substatement-open . +)

      (block-open . +)
      (block-close . 0)

      (defun-open . +)
      (defun-close . 0)
      (defun-block-intro . 0)
      (func-decl-cont . +)

      (class-open . +)
      (class-close . +)
      (inclass . +)
      (access-label . -)
      (inline-open . +)
      (inline-close . 0)

      (extern-lang-open . 0)
      (extern-lang-close . 0)
      (inextern-lang . 0)

      (statement-case-open +)

      (namespace-open . 0)
      (namespace-close . 0)
      (innamespace . 0)

      (label . 0)
      )
))

(setq randombit-style '(
   (c-basic-offset . 3)
   (c-comment-only-line-offset . 0)
   (c-offsets-alist
      (c . 0)
      (comment-intro . 0)

      (statement-block-intro . +)
      (statement-cont . +)

      (substatement . +)
      (substatement-open . 0)

      (block-open . 0)
      (block-close . 0)

      (defun-open . 0)
      (defun-close . 0)
      (defun-block-intro . +)
      (func-decl-cont . +)

      (case-label . 3)

      (class-open . 0)
      (class-close . 0)
      (inclass . +)
      (access-label . -3)
      (inline-open . 0)
      (inline-close . 0)

      (extern-lang-open . 0)
      (extern-lang-close . 0)
      (inextern-lang . 0)

      (statement-case-open . +)

      (namespace-open . 0)
      (namespace-close . 0)
      (innamespace . 0)

      (label . 0)
      )
))

(setq broadway-style '(
   (c-basic-offset . 2)
   (c-comment-only-line-offset . 0)
   (c-offsets-alist
      (c . 0)
      (comment-intro . 0)

      (statement-block-intro . +)
      (statement-cont . +)

      (substatement . +)
      (substatement-open . 0)

      (block-open . 0)
      (block-close . 0)

      (defun-open . 0)
      (defun-close . 0)
      (defun-block-intro . +)
      (func-decl-cont . +)

      (case-label . 2)

      (class-open . 0)
      (class-close . 0)
      (inclass . +)
      (access-label . -2)
      (inline-open . 0)
      (inline-close . 0)

      (extern-lang-open . 0)
      (extern-lang-close . 0)
      (inextern-lang . 0)

      (statement-case-open . +)

      (namespace-open . 0)
      (namespace-close . 0)
      (innamespace . 0)

      (label . 0)
      )
))

(defun set_styles()
  (c-add-style "botan" botan-style t)
  (c-add-style "randombit" randombit-style nil)
  (c-add-style "broadway" broadway-style nil))
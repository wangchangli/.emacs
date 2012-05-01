(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
(require 'slime)
(slime-setup '(slime-repl))


(require 'paredit)
(define-key slime-mode-map (kbd "(") 'paredit-open-parenthesis)
(define-key slime-mode-map (kbd ")") 'paredit-close-parenthesis)
(define-key slime-mode-map (kbd "\"") 'paredit-doublequote)
(define-key slime-mode-map (kbd "\\") 'paredit-backslash)

(define-key slime-mode-map (kbd "RET") 'paredit-newline)
(define-key slime-mode-map (kbd "<return>") 'paredit-newline)
(define-key slime-mode-map (kbd "C-j") 'newline)

(provide 'slime-settings)
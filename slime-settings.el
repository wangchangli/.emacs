(setq inferior-lisp-program "/usr/bin/sbcl") ; your Lisp system
(require 'slime)
(slime-setup '(slime-repl))

(provide 'slime-settings)
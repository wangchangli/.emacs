(require 'slime)
;;(require 'slime-autoloads)

(slime-setup '(inferior-slime slime-repl slime-fuzzy slime-autodoc))

(setq inferior-lisp-program "/usr/bin/sbcl"
      lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      common-lisp-hyperspec-root "~/HyperSpec/"
      slime-startup-animation nil
      slime-enable-evaluate-in-emacs t
      slime-log-events t
      slime-outline-mode-in-events-buffer nil
      slime-repl-return-behaviour :send-only-if-after-complete
      slime-autodoc-use-multiline-p t
      slime-highlight-compiler-notes t
      slime-fuzzy-completion-in-place nil)

(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

(require 'mic-paren)
(paren-activate)
(setf paren-priority 'close)

(require 'paredit)
(define-key slime-mode-map (kbd "(") 'paredit-open-parenthesis)
(define-key slime-mode-map (kbd ")") 'paredit-close-parenthesis)

(define-key slime-mode-map (kbd "\"") 'paredit-doublequote)
(define-key slime-mode-map (kbd "\\") 'paredit-backslash)

(define-key slime-mode-map (kbd "RET") 'paredit-newline)
(define-key slime-mode-map (kbd "<return>") 'paredit-newline)
(define-key slime-mode-map (kbd "C-j") 'newline)

(define-key slime-mode-map (kbd "C-h") 'backward-sexp)
(define-key slime-mode-map (kbd "C-t") 'transpose-sexps)
(define-key slime-mode-map (kbd "C-M-t") 'transpose-chars)
(define-key slime-mode-map (kbd "C-n") 'forward-sexp)
(define-key slime-mode-map (kbd "C-k") 'kill-sexp)
(define-key slime-mode-map (kbd "C-M-k") 'paredit-kill)
(define-key slime-mode-map (kbd "C-'") 'paredit-splice-sexp)
(define-key slime-mode-map (kbd "C-M-l") 'paredit-recentre-on-sexp)
(define-key slime-mode-map (kbd "C-,") 'paredit-backward-slurp-sexp)
(define-key slime-mode-map (kbd "C-.") 'paredit-forward-slurp-sexp)
(define-key slime-mode-map (kbd "C-<") 'paredit-backward-barf-sexp)
(define-key slime-mode-map (kbd "C->") 'paredit-forward-barf-sexp)
(define-key slime-mode-map (kbd "C-/") 'backward-up-list)
(define-key slime-mode-map (kbd "C-=") 'down-list)
(define-key slime-mode-map (kbd "TAB") 'slime-indent-and-complete-symbol)
(define-key slime-mode-map (kbd "C-c TAB") 'slime-complete-form)
(define-key slime-mode-map (kbd "C-c C-i") 'slime-inspect)
(define-key global-map (kbd "<f12>") 'slime-selector)

(require 'parenface)

(require 'bridge)
(autoload 'install-bridge "bridge" "Install a process bridge." t)
(setq bridge-hook 
      '(lambda ()
        ;; Example options
        (setq bridge-source-insert nil) ;Don't insert in source buffer
        (setq bridge-destination-insert nil) ;Don't insert in dest buffer
        ;; Handle copy-it messages yourself
        ))

(defvar slime-auto-compile-timer nil)
(defun slime-enable-auto-compile ()
  (setf slime-auto-compile-timer
        (run-with-idle-timer 3 t `(lambda ()
                                    (when (and slime-mode
                                               (slime-sexp-at-point)
                                               (slime-connected-p))
                                      (slime-compile-defun))))))

;; (push (slime-create-filename-translator :machine-instance "remote.example.com"
;; 					:remote-host "remote"
;; 					:username "user")
;;       slime-filename-translations)

(provide 'slime-settings)


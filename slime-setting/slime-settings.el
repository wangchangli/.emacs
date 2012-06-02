(require 'slime)
;;(require 'slime-autoloads)

(slime-setup '(inferior-slime slime-repl slime-fuzzy slime-autodoc))

(setq inferior-lisp-program "/usr/bin/sbcl"
      lisp-indent-function 'common-lisp-indent-function
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      common-lisp-hyperspec-root "/home/wangchangli/HyperSpec/"
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

;; Basic Insertion Commands
(define-key slime-mode-map (kbd "(") 'paredit-open-round)
(define-key slime-mode-map (kbd ")") 'paredit-close-round)
(define-key slime-mode-map (kbd "M-)") 'paredit-close-round-and-newline)
(define-key slime-mode-map (kbd "[") 'paredit-open-square)
(define-key slime-mode-map (kbd "]") 'paredit-close-square)
(define-key slime-mode-map (kbd "\"") 'paredit-doublequote)
(define-key slime-mode-map (kbd "M-\"") 'paredit-meta-doublequote)
(define-key slime-mode-map (kbd "\\") 'paredit-backslash);只是一个提示而已
(define-key slime-mode-map (kbd ";") 'paredit-semicolon)
(define-key slime-mode-map (kbd "M-;") 'paredit-comment-dwim)
(define-key slime-mode-map (kbd "C-j") 'paredit-newline)
;;(define-key slime-mode-map (kbd "RET") 'paredit-newline)
;;(define-key slime-mode-map (kbd "<return>") 'paredit-newline)
;;(define-key slime-mode-map (kbd "C-j") 'newline)

;; Deleting & Killing
(define-key slime-mode-map (kbd "C-d") 'paredit-forward-delete)
(define-key slime-mode-map (kbd "DEL") 'paredit-backward-delete)
(define-key slime-mode-map (kbd "C-k") 'paredit-kill)
(define-key slime-mode-map (kbd "M-d") 'paredit-forward-kill-word)
(define-key slime-mode-map (kbd "M-DEL") 'paredit-backward-kill-word)

;; Movement & Navigation
(define-key slime-mode-map (kbd "C-M-f") 'paredit-forward)
(define-key slime-mode-map (kbd "C-M-b") 'paredit-backward)
(define-key slime-mode-map (kbd "C-M-u") 'paredit-backward-up)
(define-key slime-mode-map (kbd "C-M-d") 'paredit-forward-down)
(define-key slime-mode-map (kbd "C-M-p") 'paredit-backward-down)
(define-key slime-mode-map (kbd "C-M-n") 'paredit-forward-up)
;; forward/backward list;(forward)up/down list;backward-up-list/backward-down-list;

;; Depth-Changing Commands
(define-key slime-mode-map (kbd "M-(") 'paredit-wrap-round) ;M-1 (
(define-key slime-mode-map (kbd "M-s") 'paredit-splice-sexp)
(define-key slime-mode-map (kbd "M-<up>") 'paredit-splice-sexp-kill-backward)
(define-key slime-mode-map (kbd "M-<down>") 'paredit-splice-sexp-kill-forward)
(define-key slime-mode-map (kbd "M-r") 'paredit-raise-sexp)

;; Barfage & Slurpage
(define-key slime-mode-map (kbd "C-)") 'paredit-forward-slurp-sexp)
(define-key slime-mode-map (kbd "C-\}") 'paredit-forward-barf-sexp)
(define-key slime-mode-map (kbd "C-(") 'paredit-backward-slurp-sexp)
(define-key slime-mode-map (kbd "C-{") 'paredit-backward-barf-sexp)

;; Miscellaneous Commands
(define-key slime-mode-map (kbd "M-S") 'paredit-spilt-sexp)
(define-key slime-mode-map (kbd "M-J") 'paredit-join-sexp)
(define-key slime-mode-map (kbd "C-c C-M-l") 'paredit-recentre-on-sexp)
(define-key slime-mode-map (kbd "M-q") 'paredit-reindent-defun)


(define-key slime-mode-map (kbd "C-t") 'transpose-sexps)
(define-key slime-mode-map (kbd "C-M-t") 'transpose-chars)
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


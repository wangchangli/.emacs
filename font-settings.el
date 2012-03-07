;; -*- Emacs-Lisp -*-

;; Time-stamp: <2011-10-30 20:44:16 Sunday by wangchangli>

(when (and window-system is-after-emacs-23)
 ;(require 'my-fontset-win)
  (if mswin
      ;; (huangq-fontset-courier 17)
      (huangq-fontset-consolas 17)
    ;; (huangq-fontset-dejavu 17)))
    ;; (huangq-fontset-fixedsys 17)
    (set-default-font "lucida console-10")
    ;;(set-default-font "monaco-10")
))

(provide 'font-settings)

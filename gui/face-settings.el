;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-11-26 13:49:32 Friday by taoshanwen>

(require 'ahei-face)

;; 是否使用黑色背景
(defvar use-black-background t "*Use black ground or not.")

;; 基本颜色设置
(require 'base-face-settings)

;; mode-line颜色设置
(require 'mode-line-face-settings)

;; `which-func'颜色设置
(require 'which-func-face-settings)

;; `isearch'颜色设置
(require 'isearch-face-settings)

(require 'ido-face-settings)
(require 'font-lock-face-settings)
(require 'minibuffer-face-settings)

(defface hl-line-nonunderline-face
  '((((type tty)))
    (t :background "AntiqueWhite4" :inverse-video nil))
  "`hl-line-face' without `underline'.")

(provide 'face-settings)

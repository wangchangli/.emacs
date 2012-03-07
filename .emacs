(menu-bar-mode 0)
(tool-bar-mode 0)
(global-linum-mode 1)
;(speedbar)
(ido-mode 1)

;(add-to-list 'load-path "./.iemacs/emacs-goodies-el-34.1/elisp/emacs-goodies-el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;ahei's dea;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(load  "~/.iemacs/my-subdirs")
(my-add-subdirs-to-load-path "~/.iemacs")

(require 'ahei-misc)

(require 'util)

;; 一些Emacs的小设置
(require 'misc-settings)

;; 显示行号
(require 'linum-settings)

;; color theme Emacs主题
;;(require 'color-theme-settings)

(require 'ahei-face)
;(require 'color-theme-ahei)
(require 'face-settings)

;; 高亮当前行
;;(require 'hl-line-settings)

;; 字体配置
(require 'font-settings)

;; `mode-line'显示格式
(require 'mode-line-settings)

;; 启动Emacs的时候最大化Emacs
(require 'maxframe-settings)

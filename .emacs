(menu-bar-mode 0)
(tool-bar-mode 0)
(global-linum-mode 1)
(ido-mode 1)

(load  "~/.iemacs/my-subdirs")
(my-add-subdirs-to-load-path "~/.iemacs")

(require 'ahei-misc)

(require 'util)

;; 一些Emacs的小设置
(require 'misc-settings)

(require 'ahei-face)

(require 'face-settings)

;; 字体配置
(require 'font-settings)

;; `mode-line'显示格式
(require 'mode-line-settings)

;; 启动Emacs的时候最大化Emacs
(require 'maxframe-settings)

(require 'slime-settings)

;; 王纯业的desktop, 比desktop快多了
(require 'wcy-desktop-settings)


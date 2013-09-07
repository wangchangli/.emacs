;; add all the subdirectories of .iemacs to 'load-path'
(load  "~/.iemacs/my-subdirs.el")
(my-add-subdirs-to-load-path "~/.iemacs")

;;(require gui-settings)

(require 'appearance-settings)

(ido-mode 1)

;;(require 'ido-settings)'
;;(require 'isearch-settings)
;;(require 'mode-line-settings)

(require 'ahei-misc)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

(require 'util)

(require 'misc-settings)

(require 'slime-settings)

(require 'wcy-desktop-settings)

;; language mode
(require 'coffee-mode)
(setq coffee-tab-width 2)
(require 'haml-mode)
(require 'php-mode)
(require 'markdown-mode)

(setq make-backup-files nil)

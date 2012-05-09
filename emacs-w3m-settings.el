(require 'w3m)
(setq browse-url-browser-function '(("hyperspec" . w3m-browse-url)
				    ("weitz" . w3m-browse-url)))			  

(provide 'emacs-w3m-settings)
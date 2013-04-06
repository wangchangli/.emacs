(require 'w3m)
(setq browse-url-browser-function '(("hyperspec" . w3m-browse-url)
				    ("weitz" . w3m-browse-url)
				    ("." . browse-url-default-windows-browser)))			  

(setq w3m-use-cookies t)
(setq w3m-home-page "http://www.google.com")
(setq w3m-default-display-inline-images t)
(setq w3m-default-toggle-inline-images t)

(define-key w3m-mode-map (kbd "M-n") 'w3m-next-buffer)
(define-key w3m-mode-map (kbd "M-n") 'w3m-previous-buffer)

(provide 'emacs-w3m-settings)
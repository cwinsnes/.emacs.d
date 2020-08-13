(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(org-babel-load-file (expand-file-name "~/.emacs.d/emacsinit.org"))

(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path (expand-file-name "~/.emacs.d/auto-install/"))
(add-to-list 'load-path "~/.emacs.d/elisp/autocomplete/")

(require 'rst)
(require 'auto-install)
(require 'acp)
(require 'gtags)
(require 'anything-gtags)
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(require 'markdown-mode)

(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elisp/autocomplete/ac-dict/")

(setq auto-mode-alist (cons '("\\.markdown" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.md" . gfm-mode) auto-mode-alist))
(setq auto-mode-alist 
      (append '(("\\.rst$" . rst-mode)
		( "\\.rest$" . rst-mode)) auto-mode-alist))

(setq frame-background-mode 'dark)
(add-hook 'rst-mode-hook '(lambda() (setq indent-tabs-mode nil)))
;;(auto-install-update-emacswiki-package-name t)
;;auto-install-compatibility-setup)
(setq transient-mark-mode t)
(display-time)
(global-set-key "\C-h" 'delete-backward-char)
(show-paren-mode t)
(column-number-mode t)

(autoload 'gtags-mode "gtags" "" t)
(setq gtags-mode-hook '(lambda()
			 (local-set-key "\M-t" 'gtags-find-tag)
			 (local-set-key "\M-r" 'gtags-find-rtag)
			 (local-set-key "\M-s" 'gtags-find-symbol)
			 (local-set-key "\C-t" 'gtags-pop-stack)
			 ))
(when (require 'anything-startup nil t)
  (global-set-key (kbd "\C-x b") 'anything)
)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

;;dabbrev
(global-set-key "\C-\ " 'dabbrev-expand)

;;(add-hook 'c++-mode-hook
;;	  '(lambda ()
;;	     (flymake-mode t)))
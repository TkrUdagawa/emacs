;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)
(setq package-check-signature nil)


;; MELPA-stableを追加
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'load-path "/home/udagawa/.emacs.d/packages/")

;; 初期化
(package-initialize)
(load-theme 'wombat t)
 ;(load-theme 'zenburn t)

(display-time)
(global-set-key "\C-h" 'delete-backward-char)
(global-linum-mode t)
(show-paren-mode t)
(column-number-mode t)
(setq-default tab-width 4 indent-tabs-mode nil)
(elpy-enable)
(add-hook 'after-init-hook #'global-flycheck-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (col-highlight crosshairs zenburn-theme irony yaml-mode yasnippet flycheck elpy))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"  ;; 自作スニペット
	yas-installed-snippets-dir         ;; package に最初から含まれるスニペット
	))
(push '("emacs.+/snippets/" . snippet-mode) auto-mode-alist)
(yas-global-mode 1)

(defface hlline-face
  '((((class color)
      (background dark))
     (:background "gray20"))
    (((class color)
      (background light))
     (:background "ForestGreen"))
    (t
     ()))
 "*Face used by hl-line.")

(setq hl-line-face 'hlline-face)
;;; (setq hl-line-face 'underline) ; 下線
(global-hl-line-mode)

;;; アイドルになって0.2秒後桁を表示させる
(toggle-highlight-column-when-idle 1)
(col-highlight-set-interval 0.2)
;;; hl-lineと併用すればカーソル位置を十字形にハイライトできる
(custom-set-faces
 '(col-highlight ((t (:inherit hl-line)))))
(global-hl-line-mode 1)

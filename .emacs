(package-initialize)

(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(inhibit-startup-screen t)
 '(line-number-mode t)
 '(package-selected-packages (quote (php-mode swiper magit ivy)))
 '(show-paren-mode t))

(global-linum-mode 1)

(setq linum-format "%-3d")

(ivy-mode)
(setq vc-follow-symlinks t)
(with-eval-after-load 'ivy
  (setq ivy-use-virtual-buffers t
        ivy-re-builders-alist '((t . ivy--regex-ignore-order))
        ivy-virtual-abbreviate 'full
        enable-recursive-minibuffers t
        recentf-max-saved-items nil))

(add-hook 'c-mode-common-hook '(lambda () (c-set-style "linux")))
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-s") 'swiper)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

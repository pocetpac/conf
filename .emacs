(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(package-initialize)
(setq package-list '(ag amx php-mode swiper magit ivy counsel))
(unless package-archive-contents
  (package-refresh-contents))
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(global-linum-mode 1)

(setq linum-format "%-3d"
      visible-bell 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (misterioso)))
 '(inhibit-startup-screen t)
 '(line-number-mode t)
 '(package-selected-packages (quote (ag amx php-mode swiper magit ivy)))
 '(show-paren-mode t))

(ivy-mode)
(counsel-mode)
(setq vc-follow-symlinks t)

(with-eval-after-load 'dired
  (setq dired-dwim-target t
        dired-listing-switches "-lha"))

(with-eval-after-load 'ivy
  (setq ivy-use-virtual-buffers t
        ivy-re-builders-alist '((t . ivy--regex-ignore-order))
        ivy-virtual-abbreviate 'full
        enable-recursive-minibuffers t
        recentf-max-saved-items nil))

(setq-default fill-column 78)

(with-eval-after-load 'whitespace
  (setq whitespace-line-column nil
        whitespace-style '(face trailing lines-tail space-before-tab newline
                                indentation empty space-after-tab)))

(with-eval-after-load 'ag
  (setq ag-highlight-search t)
  (setq-default ag-ignore-list '("*.svg" ".git"))
  (dolist (ag-args '(ag-arguments ag-dired-arguments))
    (set ag-args `("--depth=-1" "--follow" "--silent" "--hidden"
                   ,@(symbol-value ag-args)))))

(add-hook 'c-mode-common-hook '(lambda () (c-set-style "linux")))
(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-s") 'swiper)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (counsel magit swiper php-mode amx ag))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

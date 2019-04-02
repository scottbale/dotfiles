(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
(setq custom-file "~/.emacs.d/custom.el")
(if (not (file-exists-p custom-file))
    (write-region "" nil custom-file))

(require 'package)
;; (add-to-list 'package-archives
;;               '("marmalade" . "https://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa-stable.milkbox.net/packages/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

;; Add in your own as you wish:
(defvar my-packages '( better-defaults idle-highlight-mode ivy swiper counsel projectile
                                       zenburn-theme color-theme-solarized cider clojure-mode paredit
                                       haskell-mode markdown-mode js2-mode php-mode yaml-mode flycheck
                                       exec-path-from-shell) 
  "A list of packages to ensure are installed at launch.")

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; use solarized dark in windows, zenburn in terminal (solarized doesn't look right in terminal)
(if window-system
    (load-theme 'solarized-dark t)
  (load-theme 'zenburn t))

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b"))))

;; keybindings I got used to from technomancy starter kit
(recentf-mode t)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-+") 'text-scale-increase)
(global-set-key (kbd "C--") 'text-scale-decrease)

;; ivy
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'swiper)
(global-set-key (kbd "C-x f") 'counsel-recentf)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-c j") 'counsel-git-grep)

(set-face-attribute 'default nil :height 120)

;; markdown mode
(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.json\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))

;; no auto-fill-mode ever
(auto-fill-mode -1)
(remove-hook 'text-mode-hook 'turn-on-auto-fill)

(add-hook 'html-mode-hook
          (lambda ()
            ;; Default indentation is usually 2 spaces, changing to 4.
            (set (make-local-variable 'sgml-basic-offset) 4)))

(add-hook 'prog-mode-hook
          (lambda ()
            (idle-highlight-mode t)))

;; paredit stuff
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook 'enable-paredit-mode)
(add-hook 'emacs-lisp--mode-hook 'enable-paredit-mode)
(add-hook 'lisp-mode-hook 'enable-paredit-mode)
(eval-after-load 'paredit
  ;; need a binding that works in the terminal
  '(define-key paredit-mode-map (kbd "M-)") 'paredit-forward-slurp-sexp))

;; projectile
(projectile-global-mode +1)
(setq projectile-completion-system 'ivy)
;; (global-set-key (kbd "C-S-n") 'projectile-discover-projects-in-directory)

;; for flyspell in gfm-mode
(setq-default ispell-program-name "aspell")

;; for homebrew
(setq exec-path (append exec-path '("/usr/local/bin")))

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(javascript-jshint)))

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
  (append flycheck-disabled-checkers
    '(json-jsonlist)))

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
(exec-path-from-shell-initialize)

(load custom-file)

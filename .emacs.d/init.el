;; No mouse interface. Do this early to avoid momentary flicker.
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; OS X meta keys
(setq mac-option-key-is-meta nil)
(setq mac-command-key-is-meta t)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)

;; No splash screen.
(setq inhibit-startup-message t)

;; Use Inconsolata where available.
;;(when (member "Inconsolata" (font-family-list))
;;  (set-face-attribute 'default nil :font "Inconsolata-12"))

;; Set up load paths.
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(add-to-list 'load-path settings-dir)

;; Keep custom settings in a separate file.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Load global editor settings.
(require 'global-settings)

;; Key bindings.
(require 'key-bindings)

;; Make sure packages are installed.
(setq package-enable-at-startup nil)
(package-initialize)
(require 'setup-package)

;; Setup ivy early in case of downstream errors
(install-missing-packages
 '(ivy))

(require 'setup-ivy)

(install-missing-packages
 '(better-defaults
   idle-highlight-mode
   swiper
   counsel
   projectile
   zenburn-theme
   solarized-theme
   clojure-mode
   paredit
   haskell-mode
   markdown-mode
   js2-mode
   php-mode
   yaml-mode
   flycheck
   exec-path-from-shell
   cider
   ))

;; Load configurations.

(require 'setup-projectile)
(require 'setup-markdown)
(require 'setup-color-theme)
(require 'setup-exec-path-from-shell)
(require 'setup-paredit)
(require 'setup-flycheck)
(require 'setup-flyspell)

;; Key bindings.
(require 'key-bindings)

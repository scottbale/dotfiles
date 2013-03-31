; (color-theme-deep-blue)



;; (global-set-key (kbd "<C-tab>") 'other-window)
;; (global-set-key (kbd "<C-M-return>") 'new-frame)
;; ------------------------------------------
(global-set-key (kbd "C-S-f") 'rgrep)

;; see also:
;; help v [describe variable] case-fold-search
;; M-x set-variable
;; ------------------------------------------
;; (global-set-key (kbd "C-S-n") 'locate)
(global-set-key (kbd "C-S-n") 'find-name-dired)

;; File finding - from technomancy starter kit 1.x, removed in 2.x
(recentf-mode t)
(global-set-key (kbd "C-x f") 'recentf-open-files)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; (set-face-attribute 'default nil :height 120)

(autoload 'markdown-mode "gfm-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
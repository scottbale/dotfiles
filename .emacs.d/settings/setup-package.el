(require 'package)
(require 'cl)

(add-to-list 'package-archives '("melpa" . "http://melpa-stable.milkbox.net/packages/") t)

(package-initialize)

(defun install-missing-packages (packages)
  (condition-case nil
      (packages-install packages)
    (error
     (package-refresh-contents)
     (packages-install packages))))

(defun packages-install (packages)
  (loop for p in packages
    when (not (package-installed-p p))
      do (package-install p))
  (delete-other-windows))

(provide 'setup-package)

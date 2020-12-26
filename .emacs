;;; Emacs --- Configuration
;;; Commentary:
;; Loosely based on mefylś conf https://github.com/mefyl/emacs-config

;; MELPA packages
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(require 'helm)
(require 'helm-config)
(require 'multiple-cursors)
(require 'tramp)

;; My own packages
(defun may-load (path)
  "Load a file iff it exists."
  (when (file-readable-p path)
    (load-file path)))

(defconst conf-dir "~/.emacs.conf/"
  "Location of the configuration files")
(add-to-list 'load-path conf-dir)

(require 'my-ido)
(require 'my-autoload)
(require 'my-c-mode)
(require 'my-cmake-mode)
(require 'my-elisp)
(require 'my-font)
(require 'my-layout)
(require 'my-lisp-mode)
(require 'my-python-mode)
(require 'my-custom-funcs)
(require 'my-options)
(require 'my-hooks)
(require 'my-shortcuts)
(require 'my-magit)
(require 'my-multiple-cursors)
(require 'my-gnuserv)
(require 'my-ssh)
(require 'my-flycheck)
(require 'my-helm)
(require 'dts-mode)
(require 'vc-svn)
;; ;;(require 'diff+20)
(require 'fold-dwim)

;;https://github.com/shanecelis/hideshow-org
;;(add-to-list 'load-path "~/.emacs.d/hideshow-org")
;;(require 'hideshow-org)
;;(global-set-key "\C-ch" 'hs-org/minor-mode)
;;(hs-minor-mode 1) ;;Start folding mode by default
;;(add-hook 'prog-mode-hook 'hs-org/hs-minor-mode)
;; (add-hook 'prog-mode-hook 'linum-mode)
;; (add-hook 'prog-mode-hook 'hs-minor-mode)
;; (add-hook 'prog-mode-hook 'hs-hide-all)

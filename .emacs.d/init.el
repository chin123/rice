(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(aalto-light))
 '(custom-safe-themes
   '("294c4b6a955149c93945f901a284140df29963a57939e9ed2fc4ad79b3605080" default))
 '(evil-undo-system 'undo-redo)
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(crdt flycheck-ocaml tuareg merlin-company use-package flycheck lsp-ui lsp-mode go-mode company selectrum evil)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-font "LucidaMonoEF 13" nil t)
(load-theme 'monokai t)
(require 'selectrum)
(selectrum-mode +1)
(require 'company)
(company-mode 1)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-require-match nil)
(add-hook 'text-mode-hook 'flyspell-mode)

;; Company mode
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; Go - lsp-mode
;; Set up before-save hooks to format buffer and add/delete imports.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode and YASnippet mode
(add-hook 'go-mode-hook #'lsp-deferred)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(let ((opam-share (ignore-errors (car (process-lines "opam"
   "var" "share")))))
      (when (and opam-share (file-directory-p opam-share))
       ;; Register Merlin
       (add-to-list 'load-path (expand-file-name "emacs/site-lisp"
   opam-share))
       (autoload 'merlin-mode "merlin" nil t nil)
       ;; Automatically start it in OCaml buffers
       (add-hook 'tuareg-mode-hook 'merlin-mode t)
       (add-hook 'caml-mode-hook 'merlin-mode t)
       ;; Use opam switch to lookup ocamlmerlin binary
       (setq merlin-command 'opam)))
(require 'merlin-company)

(with-eval-after-load 'merlin
  ;; Disable Merlin's own error checking
  (setq merlin-error-after-save nil)

  ;; Enable Flycheck checker
  (flycheck-ocaml-setup))

(define-key evil-visual-state-map (kbd ">") 'evil-shift-right-visual)
(define-key evil-visual-state-map (kbd "<") 'evil-shift-left-visual)
(define-key evil-normal-state-map (kbd "Y") (kbd "y$"))

(defun evil-shift-left-visual ()
  (interactive)
  (evil-shift-left (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(defun evil-shift-right-visual ()
  (interactive)
  (evil-shift-right (region-beginning) (region-end))
  (evil-normal-state)
  (evil-visual-restore))

(fset 'yes-or-no-p 'y-or-n-p)

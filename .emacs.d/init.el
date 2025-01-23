(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
	 [default default default italic underline success warning error])
 '(custom-enabled-themes '(tango-dark))
 '(custom-safe-themes
	 '("c5801b68568b59976a8e58104c40c9b052d46cca72e367c2e43c1f36a9e79abb" "9ba6ed026986e8a2f4fae57f4e7ad08e4497a17c1fc6399bd6b3f1e6bc4b300a" "56044c5a9cc45b6ec45c0eb28df100d3f0a576f18eef33ff8ff5d32bac2d9700" "0d2c5679b6d087686dcfd4d7e57ed8e8aedcccc7f1a478cd69704c02e4ee36fe" "77fff78cc13a2ff41ad0a8ba2f09e8efd3c7e16be20725606c095f9a19c24d3d" "4594d6b9753691142f02e67b8eb0fda7d12f6cc9f1299a49b819312d6addad1d" "8d3ef5ff6273f2a552152c7febc40eabca26bae05bd12bc85062e2dc224cde9a" "df6dfd55673f40364b1970440f0b0cb8ba7149282cf415b81aaad2d98b0f0290" "456697e914823ee45365b843c89fbc79191fdbaff471b29aad9dcbe0ee1d5641" "13096a9a6e75c7330c1bc500f30a8f4407bd618431c94aeab55c9855731a95e1" "ff24d14f5f7d355f47d53fd016565ed128bf3af30eb7ce8cae307ee4fe7f3fd0" "b754d3a03c34cfba9ad7991380d26984ebd0761925773530e24d8dd8b6894738" "38c0c668d8ac3841cb9608522ca116067177c92feeabc6f002a27249976d7434" "8d8207a39e18e2cc95ebddf62f841442d36fcba01a2a9451773d4ed30b632443" "dd4582661a1c6b865a33b89312c97a13a3885dc95992e2e5fc57456b4c545176" "b5fd9c7429d52190235f2383e47d340d7ff769f141cd8f9e7a4629a81abc6b19" "10e5d4cc0f67ed5cafac0f4252093d2119ee8b8cb449e7053273453c1a1eb7cc" "da75eceab6bea9298e04ce5b4b07349f8c02da305734f7c0c8c6af7b5eaa9738" "c1d5759fcb18b20fd95357dcd63ff90780283b14023422765d531330a3d3cec2" "dfb1c8b5bfa040b042b4ef660d0aab48ef2e89ee719a1f24a4629a0c5ed769e8" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "4ade6b630ba8cbab10703b27fd05bb43aaf8a3e5ba8c2dc1ea4a2de5f8d45882" default))
 '(lsp-clients-svlangserver-formatCommand "/tools/verible-verilog-format")
 '(lsp-clients-svlangserver-launchConfiguration "/tools/verilator -sv --lint-only -Wall")
 '(package-selected-packages
	 '(lsp-verilog nimbus-theme ripgrep darcula-theme lsp-pyright yaml-mode veri-kompass vdiff undo-tree transpose-frame slime quelpa names magit lsp-mode hl-todo highlight-numbers helm-projectile helm-ls-git flycheck evil-visualstar evil-textobj-syntax evil-mc evil-leader elisp-slime-nav drag-stuff doom-themes csv-mode command-log-mode avy auto-complete ace-jump-mode)))
'(global-display-line-numbers-mode nil)
'(helm-completion-style 'emacs)
'(package-selected-packages
  '(csv-mode dap-mode helm-xref helm-lsp lsp-treemacs yasnippet doom-themes use-package flip lsp-mode drag-stuff helm-ls-git zweilight-theme yaml-mode which-key veri-kompass transpose-frame slime rtlmacs quelpa names magit hl-todo highlight-numbers helm-projectile flycheck evil elisp-slime-nav company command-log-mode comint-hyperlink color-theme-sanityinc-tomorrow bind-key bash-completion avy auto-complete ace-jump-mode))
'(resize-frame t)

(shell "start-shell")
(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

;; list of must-have packages
(setq package-list '(ace-jump-mode
		     auto-complete
		     avy
		     command-log-mode
		     elisp-slime-nav
		     flycheck
		     drag-stuff
		     lsp-mode

				 verilog-ext
				 lsp-verilog

		     ;;     flip
		     doom-themes
		     use-package

		     evil
		     evil-leader
		     evil-mc
		     evil-textobj-syntax
		     evil-visualstar

		     helm
		     helm-projectile
		     helm-ls-git
		     highlight-numbers
		     hl-todo
		     magit
		     names
		     projectile
				 ripgrep
		     quelpa
		     slime
		     transpose-frame
		     undo-tree
		     veri-kompass
		     yaml-mode
		     csv-mode

				 nimbus-theme
		     ))

(package-initialize)
(setq focus-follows-mouse t)
(setq mouse-autoselect-window t)
(setq focus-follows-mouse t)
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;; check and install packages
(defvar pkg-refreshed nil)
(with-demoted-errors
    (when (file-exists-p package-user-dir)
      (dolist (package package-list)
	(unless (package-installed-p package)
	  (unless pkg-refreshed
	    (package-refresh-contents)
	    (setq pkg-refreshed t))
	  (package-install package)))))

(defun ping-reachable-p (host)
  (= 0 (call-process "ping" nil nil nil "-c" "1" "-W" "1" host)))

 ;; load local path
(when (file-exists-p "~/.emacs.d/lisp/")
  (add-to-list 'load-path "~/.emacs.d/lisp/"))


;; disable graphic features
;; - startup message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
;; - menu bar
(menu-bar-mode -1)
;; - toolbar
(tool-bar-mode -1)
;; - scroll bars
(scroll-bar-mode -1)

;; flycheck
(require 'flycheck)

;; auto-complete
(ac-config-default)

;;
(set-keyboard-coding-system nil)
;; remove trailing spaces before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; auto revert mode (refresh buffers when changed on disk, asking for confirmation).
;; Non file buffers (e.g: dired) don ask before refreshing
(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
;; ask y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;; - redraw immediately when scrolling
(setq fast-but-imprecise-scrolling nil)

;; customize programming mode:
(add-hook 'prog-mode-hook 'highlight-numbers-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'prog-mode-hook 'column-number-mode)
(add-hook 'prog-mode-hook (lambda () (setq truncate-lines t)))



;; helm
(helm-mode 1)
(helm-adaptive-mode)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(define-key helm-map (kbd "C-z")  #'helm-select-action)
(define-key helm-map (kbd "<tab>") #'helm-execute-persistent-action)
(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
(define-key helm-map (kbd "<backtab>") #'helm-find-files-up-one-level)
(setq helm-buffer-max-length 50)
(setq helm-completion-style helm-fuzzy)
(add-to-list 'display-buffer-alist
	     `(,(rx bos "*helm" (* not-newline) "*" eos)
               (display-buffer-in-side-window)
               (inhibit-same-window . t)
               (window-height . 0.4)))
(add-to-list 'display-buffer-alist
	     '("*.*Helm.*Help.**"))


;; magit
(require 'magit-mode)
(global-set-key (kbd "C-x g") 'magit-status-quick)
;; - invalidate projectile cache when changing branch
(defun magit-invalidate-cache (&rest args)
  (projectile-invalidate-cache nil))
(advice-add 'magit-checkout :after #'magit-invalidate-cache)
;; ibuffer
(require 'ibuffer)
;; - make default buffer listing
(defalias 'list-buffers 'ibuffer)
;; - auto-refresh
(add-hook 'ibuffer-mode-hook (lambda () (ibuffer-auto-mode 1)))
;; - size filed format
(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000000000) (format "%7.1fG" (/ (buffer-size) 1000000000.0)))
   ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
   (t (format "%8d" (buffer-size)))))
;; - customize column size
(setq ibuffer-formats
      '((mark modified read-only " "
	      (name 30 30 :left :nil) " "
	      (size-h 9 -1 :right) " "
	      (mode 16 16 :left :elide) " "
	      filename-and-process)))
;; - group buffers by type
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("shell" (or
			 (mode . shell-mode)
			 (mode . term-mode)
			 (mode . eshell-mode)
			 (name . "^\\*Shell Command Output\\*$")))
               ("app" (name . ".*\\.app"))
               ("yaml" (mode . yaml-mode))
               ("python" (or
			  (mode . python-mode)
			  (mode . inferior-python-mode)
			  (name . "^\\*Python \\(Check\\|Doc\\)\\*$")))
               ("verilog " (mode . verilog-mode))
               ("C" (or
		     (derived-mode . c-mode)
		     (mode . c++-mode)))
               ("text" (mode . text-mode))
               ("asm" (mode . asm-mode))
               ("sh" (or
		      (mode . sh-mode)
		      (mode . conf-unix-mode)))
               ("emacs" (or
			 (mode . emacs-lisp-mode)
			 (mode . lisp-interaction-mode)
			 (mode . help-mode)
			 (mode . Info-mode)
			 (mode . package-menu-mode)
			 (mode . finder-mode)
			 (mode . Custom-mode)
			 (mode . apropos-mode)
			 (mode . ioccur-mode)
			 (mode . occur-mode)
			 (mode . reb-mode)
			 (mode . calc-mode)
			 (mode . calc-trail-mode)
			 (mode . messages-buffer-mode)))
               ("lisp" (or
			(mode . lisp-mode)
			(mode . slime-repl-mode)
			(mode . slime-inspector-mode)
			(name . "^\\*slime-\\(description\\|compilation\\|xref\\)\\*$")
			(name . "^\\*sldb .*\\*$")
			(filename . "^/usr/local/doc/HyperSpec/")))
               ("LaTeX" (or
			 (mode . latex-mode)
			 (mode . tex-shell)
			 (mode . TeX-output-mode)
			 (name . "^\\*\\(Latex Preview Pane \\(Welcome\\|Errors\\)\\|pdflatex-buffer\\)\\*$")))
               ("pdf" (or
		       (mode . doc-view-mode)
		       (mode . pdf-view-mode)))
               ("org" (or
		       (derived-mode . org-mode)
		       (mode . org-agenda-mode)
		       (filename . "OrgMode")))
               ("planner" (or
			   (name . "^\\*Calendar\\*$")
			   (name . "^diary$")
			   (mode . muse-mode)))
               ("git" (or
		       (derived-mode . magit-mode)
		       (filename . "\\.git\\(ignore\\|attributes\\)$")))
               ("diff" (or
			(mode . diff-mode)
			(mode . ediff-mode)
			(name . "^\\*[Ee]?[Dd]iff.*\\*$")))
               ("dired" (or
			 (mode . dired-mode)
			 (mode . wdired-mode)
			 (mode . archive-mode)
			 (mode . proced-mode)))
               ("man" (or
		       (mode . Man-mode)
		       (mode . woman-mode)))
               ("data" (or
 (filename . ".*\\.\\([ct]sv\\|dat\\)$")))
               ("misc" (name . "^\\*.+\\*$"))))))
(add-hook 'ibuffer-mode-hook
	  (lambda () (ibuffer-switch-to-saved-filter-groups "default")))
(setq ibuffer-show-empty-filter-groups nil)
(setq ibuffer-jump-offer-only-visible-buffers t)

;; projectile
(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)


;; quelpa
(setq quelpa-checkout-melpa-p nil)
(setq quelpa-update-melpa-p nil)
(setq quelpa-self-upgrade-p nil)
(require 'quelpa)

;; highlight TODOs
(require 'hl-todo)
(setq hl-todo-keyword-faces
      '(("TODO" . "#555753")))
(global-hl-todo-mode)


;; never insert '\t' but for lisp
(setq-default indent-tabs-mode nil)
(defun allow-tabs ()
  (setq-local indent-tabs-mode t))
(dolist (hook '(emacs-lisp-mode-hook lisp-mode-hook lisp-interaction-mode-hook))
  (add-hook hook 'allow-tabs))


;; function to limit TAB power
(defun bridle-tabs ()
  (interactive)
  ;; tabulation is two spaces
  (setq-local tab-width 2)
  ;; tab key inserts tabulation
  (local-set-key (kbd "TAB") 'tab-to-tab-stop)
  (local-set-key (kbd "<tab>") 'tab-to-tab-stop)
  ;; indentation is done with C-tab
  (local-set-key (kbd "<C-tab>") 'indent-for-tab-command))

;; Verilog customizations
;; - newline indents relative
(defun ret-indent-relative ()
  (interactive)
  (newline)
  (indent-relative t))
;; - line indentation is relative
(defun remap-indent-line ()
  (interactive)
  (setq-local indent-line-function 'indent-relative))
;; - cusomize syntax highlighting
(defun verilog-custom-syntax ()
  (interactive)
  (font-lock-add-keywords nil
			  ;; all capitalized words are preprocessor macros
			  '(("\\<[A-Z][A-Z0-9_]*\\>" . 'font-lock-preprocessor-face)
			    ;; correctly handle Verilog numbers
			    ("'[hdb]?[0-9a-fA-FzxZX]+\\>" . 'font-lock-constant-face)
			    ("\\<[0-9]+\\>" . 'font-lock-constant-face))))
(defun verilog-mode-customizations ()
  ;; set all indentations to two spaces
  (setq verilog-indent-level 2)
  (setq verilog-indent-level-module 2)
  (setq verilog-indent-level-declaration 2)
  (setq verilog-indent-level-behavioral 2)
  (setq verilog-indent-level-directive 2)
  (setq verilog-cexp-indent 2)
  (setq verilog-case-indent 2)
  ;; disable automatic indentation
  (setq verilog-auto-indent-on-newline t)
  (setq verilog-tab-always-indent nil)
  (setq verilog-indent-begin-after-if nil)
  (setq verilog-auto-newline nil)
  (setq verilog-auto-end-comments nil)
  (setq verilog-auto-lineup nil)
  ;; change line indentation function
  (add-hook 'verilog-mode-hook 'remap-indent-line)
  ;; disable abbreviations
  (abbrev-table-put verilog-mode-abbrev-table :enable-function (lambda () nil))
  ;; configure indentation for some keys
  (define-key verilog-mode-map (kbd ";") 'self-insert-command)
  (define-key verilog-mode-map (kbd "RET") 'ret-indent-relative)
  ;; change tab behavior
  (add-hook 'verilog-mode-hook 'bridle-tabs)
   ;; custom syntax
  (add-hook 'verilog-mode-hook 'verilog-custom-syntax))
(eval-after-load 'verilog-mode '(verilog-mode-customizations))

;; SystemVerilog LSP
(use-package verilog-ext)
(require 'lsp-verilog)
(setq lsp-clients-svlangserver-bin-path "/home/giocom/.emacs.d/svlangserver/bin/main.js")

(add-hook 'verilog-mode-hook #'lsp-deferred)


(defun insert-file-name ()
  "Insert the full path file name into the current buffer."
   (interactive)
   (insert (buffer-file-name (window-buffer (minibuffer-selected-window)))))

;;(unless (package-installed-p 'quelpa)
;;  (package-refresh-contents)
;;  (package-install 'quelpa))

;;(setq quelpa-checkout-melpa-p nil)
;;(setq quelpa-update-melpa-p nil)
;;(setq quelpa-self-upgrade-p nil)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(split-window-right)
;; duplicate line function
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
 )


;; random stuff giocom01 added from online guides

(require 'paren) (show-paren-mode t) ;; Highlights the matching parentheses when you are next to one with the cursor
(global-set-key (kbd "M-C-<left>")  'windmove-left)
(global-set-key (kbd "M-C-<right>") 'windmove-right)
(global-set-key (kbd "M-C-<up>")    'windmove-up)
(global-set-key (kbd "M-C-<down>")  'windmove-down)
(global-set-key (kbd "C-q")         'projectile-grep)
;; (drag-stuff-global-mode)
(global-set-key (kbd "s-<up>")         'drag-stuff-up)
(global-set-key (kbd "s-<down>")       'drag-stuff-down)
(global-set-key (kbd "s-<right>")      'drag-stuff-right)
(global-set-key (kbd "s-<left>")       'drag-stuff-left)

(global-set-key (kbd "C-d") 'duplicate-line)

 ;;; resize-frame.el --- A minor mode to resize frames easily.  -*- lexical-binding: t; -*-

;; Press "C-M-r" and use arrow-keys to adjust frames. press any key to done.§

(defun enlarge-window-4-times ()
  "Enlarge a lot vertically"
  (interactive)
  (enlarge-window)
  (repeat)
  (repeat)
  (repeat))
(defun enlarge-window-horizontally-4-times ()
  "Enlarge a lot horizontally"
  (interactive)
  (enlarge-window-horizontally)
   (repeat)
   (repeat)
   (repeat))

(defvar resize-frame-map
  (let ((map (make-keymap)))
    (define-key map (kbd "<up>") 'enlarge-window-4-times)
    (define-key map (kbd "<down>") 'shrink-window)
    (define-key map (kbd "<right>") 'enlarge-window-horizontally-4-times)
    (define-key map (kbd "<left>") 'shrink-window-horizontally)
    (set-char-table-range (nth 1 map) t 'resize-frame-done)
    (define-key map (kbd "C-p") 'enlarge-window-4-times)
    (define-key map (kbd "C-n") 'shrink-window)
    (define-key map (kbd "C-f") 'enlarge-window-horizontally-4-times)
    (define-key map (kbd "C-b") 'shrink-window-horizontally)
    map))

(define-minor-mode resize-frame
  "A simple minor mode to resize-frame.
 Press any key to apply."
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " ResizeFrame"
  ;; The minor mode bindings.
  :keymap resize-frame-map
  :global t
  (if (<= (length (window-list)) 1)
      (progn (setq resize-frame nil)
             (message "Only root frame exists, abort."))
    (message "Use arrow-keys to adjust frames.")))

(defun resize-frame-done ()
  (interactive)
  (setq resize-frame nil)
  (message "Done."))

(global-set-key (kbd "C-M-<space>") 'resize-frame)

(provide 'resize-frame)
 ;;; resize-frame.el ends here

;; ;; swap buffers quickly
;; (require 'buffer-move)
;; (global-set-key (kbd "<C-tab>")     'buf-move-up)
;; (global-set-key (kbd "<C-escape>")   'buf-move-down)
;; (global-set-key (kbd "<ESC-left>")   'buf-move-left)
;; (global-set-key (kbd "<ESC-right>")  'buf-move-right)

 ;;; buffer-move.el ends here


;; theme setting
;; (require 'use-package)
;; (use-package nimbus-theme)
;; (set-face-attribute 'default nil :font "Iosevka")
;; (set-frame-font "Iosevka" nil t)

;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
 ;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
;;   ;; (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   ;; (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
;;   ;; (doom-themes-treemacs-config)
;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))
(put 'narrow-to-region 'disabled nil)


(setq-default tab-width 2)

;; new csv mode stuff
(require 'csv-mode)
(setq csv-separators '(","))

;; automatically activate modes when opening file formats
(add-to-list 'auto-mode-alist '("\\.csv\\'"  . csv-mode))



;; lsp for python
(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright") ;; or basedpyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferre

;; small QoL improvements
;; Remember and restore the last cursor location of opened files
(save-place-mode 1)

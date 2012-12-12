;; Load-path
(add-to-list 'load-path "~/.emacs.d/")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Show column number
(column-number-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color theming
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load color-theme
(add-to-list 'load-path "~/.emacs.d/elpa/color-theme")
(require 'color-theme)

;; Enable tomorrow-theme
(add-to-list 'load-path "~/.emacs.d/tomorrow-theme")
(require 'color-theme-tomorrow)
(color-theme-tomorrow-night-bright)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FB
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defvar master-dir (getenv "ADMIN_SCRIPTS"))
(load-library (concat master-dir "/master.emacs"))

;; Tags
;; (let (large-file-warning-threshold 'nil) ; Really large file(visit-tags-table "~/www/TAGS")
;; (visit-tags-table "~/www/TAGS"))

;; Autocomplete
(load "/home/engshare/tools/pfff_php")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Package manager
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
;; Any add to list for package-archives (to add marmalade or melpa) goes here
(add-to-list 'package-archives
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (Better?) python indentation
(load "~/.emacs.d/elpa/python-20120402/python")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Autocompletion
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete/ac-dict")
(ac-config-default)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hack
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq compile-command "/mnt/vol/engshare/tools/hh_client")
(global-set-key (kbd "M-RET") 'compile)
(define-key input-decode-map "\e\eOA" [(meta up)])
(define-key input-decode-map "\e\eOB" [(meta down)])
(global-set-key [(meta up)] 'next-error)
(global-set-key [(meta down)] 'previous-error)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Eclim
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Init
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-eclim/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/emacs-eclim/vendor"))
(require 'eclim)

(setq eclim-auto-save t)
(global-eclim-mode)

(require 'eclimd)

;; Set install dir
(custom-set-variables
 '(eclim-eclipse-dirs '("/opt/eclipse")))
(custom-set-variables
 '(eclim-executable "/opt/eclipse/eclim"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Compile errors
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq help-at-pt-display-when-idle t)
(setq help-at-pt-timer-delay 0.1)
(help-at-pt-set-timer)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; AC
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; regular auto-complete initialization
(require 'auto-complete-config)
(ac-config-default)

;; add the emacs-eclim source
(require 'ac-emacs-eclim-source)
(add-hook 'eclim-mode-hook (lambda ()
                             (add-to-list 'ac-sources 'ac-source-emacs-eclim)
                             (add-to-list 'ac-sources 'ac-source-emacs-eclim-c-dot)))

;; company mode
(require 'company)
(require 'company-emacs-eclim)
(company-emacs-eclim-setup)
(global-company-mode t)

;; Use company completions instead
(defun eclim-company-tab ()
  (interactive)
  (setq p (point))
  (indent-according-to-mode)
  (and
   (eq p (point))
   (company-complete))
  )

;; Try to override default tab behavior
;; (add-hook 'java-mode-hook (lambda ()
;;                             (define-key java-mode-map (kbd "TAB") 'eclim-company-tab)))

;; Declaration search
(add-hook 'java-mode-hook (lambda ()
                            (define-key java-mode-map (kbd "M-.") 'eclim-java-find-declaration)))

;; (require 'ac-company)
;; (ac-company-define-source ac-source-company-eclim company-emacs-eclim)
;; (add-hook 'java-mode-hook
;;           (lambda ()
;;             (add-to-list 'ac-source-e

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; elisp
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Eval buffer
(global-set-key (kbd "C-M-z") 'eval-buffer)


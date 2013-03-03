;; Load-path
(add-to-list 'load-path "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d/submodules/org-mode")
(add-to-list 'load-path "~/.emacs.d/submodules/python-mode")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; General
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Show column number
(column-number-mode)

;; Indent on return
(global-set-key (kbd "RET") 'newline-and-indent)

;; Pair ()'s, {}'s, etc.
;(electric-pair-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Color theming
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Load color-theme
(add-to-list 'load-path "~/.emacs.d/elpa/color-theme")
(require 'color-theme)

;; Enable tomorrow-theme
(add-to-list 'load-path "~/.emacs.d/tomorrow-theme")
(require 'color-theme-tomorrow)
(color-theme-tomorrow-night)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; FB - private definitions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (file-exists-p "~/.emacs.d/fb.el")
    (require 'fb))

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
;; Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'python-mode)

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; windows and frames
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun delete-other-windows-and-split-window-horizontally ()
  (interactive)
  (delete-other-windows)
  (split-window-horizontally))

(global-set-key (kbd "C-x p") 'delete-other-windows-and-split-window-horizontally)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key mode-specific-map [?a] 'org-agenda)

(eval-after-load "org-agenda"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))

     (define-key org-agenda-mode-map "\C-n" 'next-line)
     (define-key org-agenda-keymap "\C-n" 'next-line)
     (define-key org-agenda-mode-map "\C-p" 'previous-line)
     (define-key org-agenda-keymap "\C-p" 'previous-line)))

(require 'remember)

(add-hook 'remember-mode-hook 'org-remember-apply-template)

(define-key global-map [(control meta ?r)] 'remember)

(custom-set-variables
 '(org-agenda-files (quote ("~/notes/todo.org")))
 '(org-default-notes-file "~/notes/notes.org")
 '(org-agenda-ndays 7)
 '(org-deadline-warning-days 14)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-reverse-note-order t)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-agenda-custom-commands
   (quote (("d" todo "DELEGATED" nil)
           ("c" todo "DONE|DEFERRED|CANCELLED" nil)
           ("w" todo "WAITING" nil)
           ("W" agenda "" ((org-agenda-ndays 21)))
           ("A" agenda ""
            ((org-agenda-skip-function
              (lambda nil
                (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]")))
             (org-agenda-ndays 1)
             (org-agenda-overriding-header "Today's Priority #A tasks: ")))
           ("u" alltodo ""
            ((org-agenda-skip-function
              (lambda nil
                (org-agenda-skip-entry-if (quote scheduled) (quote deadline)
                                          (quote regexp) "\n]+>")))
             (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
 '(org-remember-store-without-prompt t)
 '(org-remember-templates
   (quote ((116 "* TODO %?\n  %u" "~/notes/todo.org" "Tasks")
           (110 "* %u %?" "~/notes/notes.org" "Notes"))))
 '(remember-annotation-functions (quote (org-remember-annotation)))
 '(remember-handler-functions (quote (org-remember-handler))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; IDO mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

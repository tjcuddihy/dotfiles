;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Tom Cuddihy"
      user-mail-address "tjcuddihy@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; (custom-set-faces!
;;   '(hl-fill-column-face :background "red"))
  ;; '(hl-fill-column-face :background "#073642" :foreground "#839496"))
  ;; '(hl-fill-column-face :background "grey"))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/gtd/")
(after! org
  ;; (setq org-agenda-files '((concat org-directory "gtd.org")
  ;;                          (concat org-directory "inbox.org")
  ;;                          (concat org-directory "tickler.org")))
  ;; (setq org-capture-templates '(("t" "tasks")
  ;; ;; (add-to-list 'org-capture-templates '(("t" "tasks")
  ;;                               ("tt" "Todo [inbox]" entry
  ;;                                (file+headline (concat org-directory "inbox.org") "Tasks")
  ;;                                "* TODO %i%? %^G")
  ;;                               ("tc" "Todo - with context" entry
  ;;                                (file+headline (concat org-directory "inbox.org") "Tasks")
  ;;                                "* TODO %i%? %^G\n %a")
  ;;                               ("T" "Tickler" entry
  ;;                                (file+headline (concat org-directory "tickler.org") "Tickler")
  ;;                                "* %i%? \n %^t %^G")))
  ;; (setq org-refile-targets '(((concat org-directory "gtd.org") :maxlevel . 3)
  ;;                            ((concat org-directory "someday.org") :level . 1)
  ;;                            ((concat org-directory "tickler.org") :maxlevel . 2)))

  ;; (setq org-refile-use-outline-path 'file)
  ;; (setq org-outline-path-complete-in-steps nil)
  (setq org-todo-keywords
        '((sequence "TODO(t)" "NEXT(n)" "WAIT(w@/!)" "|" "DONE(d!)" "CANCELLED(c@)")))

  ;; Stop hl-todo mode stealing in ORG mode
  ;; (add-hook 'org-mode-hook (lambda () (hl-todo-mode -1) nil))
  ;; Colours from Solarized definitions
  ;; https://ethanschoonover.com/solarized/
  (setq org-todo-keyword-faces
        '(("TODO" . "#268bd2") ; blue
          ("NEXT" . "#d33682") ; magenta
          ("WAIT" . "#93a1a1") ; brcyan
          ))
  (setq org-log-done 'time)
  (setq org-indent-mode t)
  (setq org-startup-indented t)
  (setq org-startup-folded 't)
  (add-hook 'org-mode-hook
            '(lambda ()
               (visual-line-mode 1)))

  (setq org-agenda-files '("~/Dropbox/gtd/gtd.org"
                           "~/Dropbox/gtd/inbox.org"
                           "~/Dropbox/gtd/tickler.org"))

  (setq org-capture-templates '(("t" "tasks")
                                ("tt" "Todo [inbox]" entry
                                 (file+headline "~/Dropbox/gtd/inbox.org" "Tasks")
                                 "* TODO %i%? %^G")
                                ("tc" "Todo - with context" entry
                                 (file+headline "~/Dropbox/gtd/inbox.org" "Tasks")
                                 "* TODO %i%? %^G\n %a")
                                ("T" "Tickler" entry
                                 (file+headline "~/Dropbox/gtd/tickler.org" "Tickler")
                                 "* %i%? \n %^t %^G")
                                ))

  (setq org-refile-targets '(("~/Dropbox/gtd/gtd.org" :maxlevel . 3)
                             ("~/Dropbox/gtd/someday.org" :level . 1)
                             ("~/Dropbox/gtd/projects.org" :level . 1)
                             ("~/Dropbox/gtd/tickler.org" :maxlevel . 2)))

  (setq org-refile-use-outline-path 'file)
  (setq org-outline-path-complete-in-steps nil)
  )

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; auto-fill-mode is VERY annoying. It adds newlines to long lines which did not
;; work well for me.
(add-hook! 'org-mode-hook (auto-fill-mode -1))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c g k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c g d') to jump to their definition and see how
;; they are implemented.

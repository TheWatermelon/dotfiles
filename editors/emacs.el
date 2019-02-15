;;;            ;;;
;; EMACS CONFIG ;;
;;;            ;;;

;;;       ;;;
;; Startup ;;
;;;       ;;;
(require 'package)

;; Packages database ;;
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; Properties ;;
(setq package-enable-at-startup nil)
(set-default-font "Source Code Pro-13")

;; Initialization ;;
(package-initialize)


;;;               ;;;
;; Package manager ;;
;;;               ;;;
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))


;;;                           ;;;
;; Evil (vim-like keybindings) ;;
;;;                           ;;;
(use-package evil
  :config
  (evil-mode 1))


;;;        ;;;
;; Org-mode ;;
;;;        ;;;
(require 'org)

;; Keybindings ;;
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-c /") 'org-match-sparse-tree)

;; Org bullets
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-bullets-bullet-list '("◉" "○" "■" "◆" "▲" "▶"))

;; Properties ;;
;(setq org-log-done t)
;; default directory
(setq org-directory "~/Dropbox/org-mode")
;; default notes file
(setq org-default-notes-file "~/Dropbox/org-mode/notes.org")
;; org files read by the agenda
(setq org-agenda-files (list "~/Dropbox/org-mode/todo.org"
                             "~/Dropbox/org-mode/notes.org"
                             "~/Dropbox/org_ugo/notes_2_canards.org"))
;; state keywords
(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "DONE(d)" "NOTE(o)"))))
;; state colors
(setq org-todo-keyword-faces
      (quote (("NOTE" :foreground "dark orange" :weight bold)
              ("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold))))
;; Capture templates for: TODO tasks, Notes
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Dropbox/org-mode/todo.org")
               "* TODO %?\n")
              ("n" "note" entry (file "~/Dropbox/org-mode/notes.org")
               "* NOTE %?\n"))))
;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t))))))

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
(setq inhibit-startup-screen nil)

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
(use-package org-bullets
             :config
             (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
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
      (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)" "NOTE(o)"))))
;; state colors
(setq org-todo-keyword-faces
      (quote (("NOTE" :foreground "dark orange" :weight bold)
              ("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold))))
;; Capture templates for: TODO tasks, Notes
(setq org-capture-templates
      (quote (("t" "todo" entry (file "~/Dropbox/org-mode/todo.org")
               "\n* TODO %?\n")
              ("n" "note" entry (file "~/Dropbox/org-mode/notes.org")
               "\n* NOTE %?\n"))))
;; Custom agenda command definitions
(setq org-agenda-custom-commands
      (quote (("N" "Notes" tags "NOTE"
               ((org-agenda-overriding-header "Notes")
                (org-tags-match-list-sublevels t))))))
;; Hide the emphasis markup (e.g. /.../ for italics, *...* for bold, etc.)
;; /!\ 'bug' in org-mode when making headlines : *** (three stars showed) → bold * (one star showed)
;(setq org-hide-emphasis-markers t)
;; Font-lock substitution for list markers
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
;; Long lines will flow and adjust to the width of the window
;(add-hook 'org-mode-hook 'visual-line-mode)

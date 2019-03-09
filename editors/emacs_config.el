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

;;;             ;;;
;; Markdown mode ;;
;;;             ;;;
;;(use-package markdown-mode
;;  :ensure t
;;  :commands (markdown-mode gfm-mode)
;;  :mode (("README\\.md\\'" . gfm-mode)
;;         ("\\.md\\'" . markdown-mode)
;;         ("\\.markdown\\'" . markdown-mode))
;;  :init (setq markdown-command "multimarkdown"))
;; Use visual-line-mode in gfm-mode
;;(defun my-gfm-mode-hook ()
;;  (visual-line-mode 1))
;;(add-hook 'gfm-mode-hook 'my-gfm-mode-hook)

;;;                      ;;;
;; Distraction-free setup ;;
;;;                      ;;;

;; Prevent the cursor from blinking
(blink-cursor-mode 0)
;; Disable the scroll bar
(scroll-bar-mode 0)
;; Disable the menu bar
(menu-bar-mode 0)
;; Disable the tool bar
(tool-bar-mode 0)
;; Don't use messages you don't read
(setq initial-scratch-messages "")
(setq inhibit-startup-messages t)
;; Don't let emacs hurt your ears
(setq visible-bell t)
;; Inhibits the initial startup echo area message
(setq inhibit-startup-echo-area-message "walter")

;; See http://bzg.fr/emacs-hide-mode-line.html
(defvar-local hidden-mode-line-mode nil)
(defvar-local hide-mode-line nil)

(define-minor-mode hidden-mode-line-mode
  "Minor mode to hide the mode-line in the current buffer."
  :init-value nil
  :global nil
  :variable hidden-mode-line-mode
  :group 'editing-basics
  (if hidden-mode-line-mode
      (setq hide-mode-line mode-line-format
            mode-line-format nil)
    (setq mode-line-format hide-mode-line
          hide-mode-line nil))
  (force-mode-line-update)
  ;; Apparently force-mode-line-update is not always enough to
  ;; redisplay the mode-line
  (redraw-display)
  (when (and (called-interactively-p 'interactive)
             hidden-mode-line-mode)
    (run-with-idle-timer
     0 nil 'message
     (concat "Hidden Mode Line Mode enabled.  "
             "Use M-x hidden-mode-line-mode to make the mode-line appear."))))

;; Activate hidden-mode-line-mode
(hidden-mode-line-mode 1)

;; If you want to hide the mode-line in all new buffers
(add-hook 'after-change-major-mode-hook 'hidden-mode-line-mode)

;; Alternatively, you can paint your mode-line in White but then
;; you'll have to manually paint it in black again
;; (custom-set-faces
;;  '(mode-line-highlight ((t nil)))
;;  '(mode-line ((t (:foreground "white" :background "white"))))
;;  '(mode-line-inactive ((t (:background "white" :foreground "white")))))

;; A small minor mode to use a big fringe
(defvar bzg-big-fringe-mode nil)
(define-minor-mode bzg-big-fringe-mode
  "Minor mode to use big fringe in the current buffer."
  :init-value nil
  :global t
  :variable bzg-big-fringe-mode
  :group 'editing-basics
  (if (not bzg-big-fringe-mode)
      (set-fringe-style nil)
    (set-fringe-mode
     (/ (- (frame-pixel-width)
           (* 100 (frame-char-width)))
        2))))

;; Now activate this global minor mode
;;(bzg-big-fringe-mode 1)

;; To activate the fringe by default and deactivate it when windows
;; are split vertically, uncomment this:
;;(add-hook 'window-configuration-change-hook
;;          (lambda ()
;;            (if (delq nil
;;                      (let ((fw (frame-width)))
;;                        (mapcar (lambda(w) (< (window-width w) (/ fw 2)))
;;                                (window-list))))
;;                (bzg-big-fringe-mode 0)
;;              (bzg-big-fringe-mode 1))))

;; Use a minimal cursor
;; (setq default-cursor-type 'hbar)

;; Get rid of the indicators in the fringe
(mapcar (lambda(fb) (set-fringe-bitmap-face fb 'org-hide))
        fringe-bitmaps)

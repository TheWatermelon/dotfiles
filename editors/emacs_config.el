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
(add-to-list 'package-archives '("gnu" . "http://mirrors.163.com/elpa/gnu/"))

;; Properties ;;
(setq package-enable-at-startup nil)
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

;;;    ;;;
;; PATH ;;
;;;    ;;;
(defun set-exec-path-from-shell-PATH ()
  "Sets the exec-path to the same value used by the user shell"
  (let ((path-from-shell
         (replace-regexp-in-string
          "[[:space:]\n]*$" ""
          (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

;; call function now
(set-exec-path-from-shell-PATH)

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
(add-hook 'org-mode-hook 'visual-line-mode)


;;;           ;;;
;; KEYBINDINGS ;;
;;;           ;;;

;; ALT is considered as ALT and not interpreted as META
(setq-default mac-option-modifier nil)

;; Fn is considered as META and not interpreted as Fn
(setq-default mac-function-modifier 'meta)

;; Menu bar on right click
(global-set-key [mouse-3]
  `(menu-item ,(purecopy "Menu Bar") ignore
    :filter (lambda (_)
              (if (zerop (or (frame-parameter nil 'menu-bar-lines) 0))
                  (mouse-menu-bar-map)
                (mouse-menu-major-mode-map)))))

;;;                      ;;;
;; Distraction-free setup ;;
;;;                      ;;;

;; Prevent the cursor from blinking
(blink-cursor-mode 0)
;; Disable the scroll bar
(scroll-bar-mode 0)
;; Disable the menu bar
;(menu-bar-mode 0)
;; Disable the tool bar
(tool-bar-mode 0)
;; Disable left and right fringes
(fringe-mode 0)
;; Don't use messages you don't read
(setq initial-scratch-messages "")
(setq inhibit-startup-messages t)
;; Don't let emacs hurt your ears
(setq visible-bell t)
;; Inhibits the initial startup echo area message
(setq inhibit-startup-echo-area-message "walter")

;;;                    ;;;
;; CUSTOM-SET-VARIABLES ;;
;;;                    ;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#2e3436" "#a40000" "#4e9a06" "#c4a000" "#204a87" "#5c3566" "#729fcf" "#eeeeec"])
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "8dce5b23232d0a490f16d62112d3abff6babeef86ae3853241a85856f9b0a6e7" "604ac011fc9bd042bc041330b3a5e5a86e764a46f7e9fe13e2a1f9f83bf44327" "732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" default)))
 '(fci-rule-color "#ECEFF1")
 '(hl-sexp-background-color "#efebe9")
 '(hl-todo-keyword-faces
   (quote
    (("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f"))))
 '(org-support-shift-select t)
 '(package-selected-packages
   (quote
    (flucui-themes tango-plus-theme twilight-bright-theme spacemacs-theme org-bullets evil use-package)))
 '(pdf-view-midnight-colors (quote ("#655370" . "#fbf8ef")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#B71C1C")
     (40 . "#FF5722")
     (60 . "#FFA000")
     (80 . "#558b2f")
     (100 . "#00796b")
     (120 . "#2196f3")
     (140 . "#4527A0")
     (160 . "#B71C1C")
     (180 . "#FF5722")
     (200 . "#FFA000")
     (220 . "#558b2f")
     (240 . "#00796b")
     (260 . "#2196f3")
     (280 . "#4527A0")
     (300 . "#B71C1C")
     (320 . "#FF5722")
     (340 . "#FFA000")
     (360 . "#558b2f"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;     ;;;
;; THEME ;;
;;;     ;;;
(load-theme 'tango-plus t)

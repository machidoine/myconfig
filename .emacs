(if (file-exists-p "std.el")
    (load "std.el"))
(if (file-exists-p "std comment.el")
    (load "std_comment.el"))

(if (file-exists-p "~/.myemacs")
    (load-file "~/.myemacs"))

(menu-bar-mode nil)


(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)

(defun coffee-custom ()
    "coffee-mode-hook"
      ;; Emacs key binding
      (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer))
(add-hook 'coffee-mode-hook '(lambda () (coffee-custom)))

; skip message a startup
(setq inhibit-startup-message t)

; empty stratch buffer
(setq initial-scratch-message nil)

; allow mark to be put with 2 levels
(transient-mark-mode nil)


;; Raccourcis clavier
(global-set-key [f2] 'save-buffer)
(global-set-key [f3] 'find-file)
(global-set-key [f4] 'kill-this-buffer)
(global-set-key [f6] 'indent-region)
(global-set-key [f7] 'comment-region)
(global-set-key [f8] 'next-error)
(global-set-key [f9] 'compile)
(global-set-key [f10] 'gdb)
(global-set-key [(meta g)] 'goto-line)

(global-set-key [(meta up)] 'windmove-up)
(global-set-key [(meta down)] 'windmove-down)
(global-set-key [(meta right)] 'windmove-right)
(global-set-key [(meta left)] 'windmove-left)

(global-set-key [(ctrl <)] 'winner-undo)
(global-set-key [(ctrl >)] 'winner-redo)

(global-set-key [(control c) (h)] 'insert-header-guard)

;; Afficher la parenthese correspondante
(require 'paren)
(show-paren-mode)

(ido-mode t)
; do not search files in other directories
(setq ido-auto-merge-work-directories-length -1)


(winner-mode t)


(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq-default auto-fill-function 'do-auto-fill)

;; Show line-number in the mode line
;;(line-number-mode 1)

;; Show column-number in the mode line
;;(column-number-mode 1)

(column-number-mode t)
(line-number-mode t)


(auto-fill-mode t)
(setq fill-column 300)


;; Sauvegarde des historiques (fichiers ouverts, fonctions invoquées,
;; expressions rationnelles saisies, etc.) d'une session à l'autre.
;;(require 'session)
;;(add-hook 'after-init-hook 'session-initialize)
;;(setq session-initialize '(de-saveplace session places keys menus))

;; La flèche de direction vers le bas ne doit pas étendre le fichier
;; en fin de tampon (seul un retour chariot explicite le fait).
(setq next-line-add-newlines nil)

;; Laisser le curseur en place lors d'un défilement par pages. Par
;; défaut, Emacs place le curseur en début ou fin d'écran selon le
;; sens du défilement.
(setq scroll-preserve-screen-position t)


;; Lorsque le curseur atteint la fin de la fenêtre, le contenu se
;; déplace d'une seule ligne et non d'une demi-fenêtre.
(setq scroll-step 1)

;; Conserver une seule ligne de contexte lors d'un déplacement d'une
;; page dans le contenu (appui sur « page up » ou « page down »)
(setq next-screen-context-lines 1)

; TEXT HIGHLIGHTING
(show-paren-mode t);; highlight opposite ( { [
(setq-default show-trailing-whitespace t)       ;; show trailing
;; whitespaces
(custom-set-faces       ;; red comments
 '(font-lock-comment-face ((t (:foreground "brown")))))
  (if (functionp 'global-hi-lock-mode)
      (global-hi-lock-mode 1)
    (hi-lock-mode 1))

(add-hook 'write-file-hooks 'delete-trailing-whitespace)


;; Don’t switch to GDB-mode buffers
(setq ido-ignore-buffers (quote ("\\‘\\*breakpoints of.*\\*\\’"
  "\\‘\\*stack frames of.*\\*\\’" "\\‘\\*gud\\*\\’"
  "\\‘\\*locals of.*\\*\\’"  "\\‘ ")))
;; Better gdb
(setq-default gdb-many-windows t)


; -----------------------------------------------------------------------------
;; Insert header guard in C/C++ header file
;; the recognized extensions are .h, .hh or .hxx
(defun insert-header-guard ()
  (interactive)
  (if (string-match "\\.h\\(h\\|xx\\)?$" (buffer-name))
      (let ((header-guard
             (upcase (replace-regexp-in-string "[-.]" "_" (buffer-name)))))
        (save-excursion
          (goto-char (point-min))
          (insert "#ifndef " header-guard "\n")
          (insert "# define " header-guard "\n\n")
          (goto-char (point-max))
          (insert "\n#endif /* !" header-guard " */")))
    (message "Invalid C/C++ header file.")))



;;(xterm-mouse-mode t);
;;(mouse-wheel-mode t);



;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.

;;(load-file "~/cedet-1.0/common/cedet.el")


;; Enable EDE (Project Management) features

;;(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;;(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;;(semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;;(require 'semantic-ia)

;;(require 'semantic-gcc)



; EOF

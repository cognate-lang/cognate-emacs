;;; cognate.el --- A mode for the Cognate programming language                     -*- lexical-binding: t; -*-

;; Copyright (C) 2022 Finn Barber

;; Author: Finn Barber
;; Keywords: cognate highlighting
;; Version: 0.0.1

;;; Commentary:

;; Adds a mode for the Cognate programming language with syntax highlighting.  It is automatically enabled in files with the .cog extension.

;;; Code:

(defvar cognate-mode-hook nil)
(defvar cognate-mode-map (make-keymap))

(add-to-list 'auto-mode-alist '("\\.cog\\'" . cognate-mode))

(defconst cognate-font-lock-keywords
  (list
      '("\\<\\([SL][eE][tT]\\|D[eE][fF]\\|T[yY][pP][eE]\\)\\>" . font-lock-keyword-face)
      ;'("\\<[A-Z]\\w*\\>" . font-lock-function-name-face)
      '("\\<\\(D[oO]\\|I[fF]\\|C[aA][sS][eE]\\|W[hH][eE][nN]\\|U[nN][lL][eE][sS][sS]\\)\\>" . font-lock-builtin-face)
      '(";" . font-lock-preprocessor-face)
      '("\\\\\\<\\w*\\>" . font-lock-keyword-face)
      '("\\<[a-z]\\w*\\>" . font-lock-comment-face)
      '("\\<-?[0-9]+\\(\\.[0-9]+\\)?[a-z]*\\>" . font-lock-constant-face)))

(defvar cognate-mode-syntax-table
  (let ((st (make-syntax-table)))
    (modify-syntax-entry ?\; "w" st)
    (modify-syntax-entry ?' "w" st)
    (modify-syntax-entry ?- "w" st)
    (modify-syntax-entry ?! "w" st)
    (modify-syntax-entry ?? "w" st)
    (modify-syntax-entry ?~ "! 12" st)
    (modify-syntax-entry ?\n ">" st)
    (modify-syntax-entry ?\" "\"" st)
    (modify-syntax-entry ?\( "()" st)
    (modify-syntax-entry ?\) ")(" st)
    (modify-syntax-entry ?\\ "'" st)
    st))

(defun cognate-mode()
  (interactive)
  (kill-all-local-variables)
  (use-local-map cognate-mode-map)
  (set-syntax-table cognate-mode-syntax-table)
  (set (make-local-variable 'font-lock-defaults) '(cognate-font-lock-keywords))
  (setq major-mode 'cognate-mode)
  (setq mode-name "Cognate")
  (run-hooks 'cognate-mode-hook))

(provide 'cognate)
;;; cognate.el ends here

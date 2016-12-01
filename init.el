;; set coding utf-8
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;;(load-theme 'charcoal-black t)
(load-theme 'dark-laptop t)
;;(load-theme 'hober t)


;; scrolling by 1 line
(setq scroll-conservatively 1)

;; showing line number with nlinum
(add-to-list 'load-path "~/.emacs.d/elpa/nlinum-1.6")
(require 'nlinum)
(global-nlinum-mode t)
;; line format
(setq nlinum-format "%4d  ")
;; making linum less slow
;;(setq linum-delay t)
;;(defadvice linum-schedule (around my-linum-schedule () activate)
;;    (run-with-idle-timer 0.2 nil #'linum-update-current))

;; auto indentation
(global-set-key "\C-m" 'newline-and-indent) 

(require 'python)
(defun python-indent-guess-indent-offset ()
  "Guess and set `python-indent-offset' for the current buffer."
  (interactive)
  (goto-char block-end)
  (python-util-forward-comment)
  (current-indentation)
  (if (> indentation 0)
      (set (make-local-variable 'python-indent-offset) indentation)
    (message "Can't guess python-indent-offset, using defaults: %s" python-indent-offset)))

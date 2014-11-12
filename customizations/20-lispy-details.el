;;
;; Enable paredit for lisps, enable cider for clojure
;; also enable rainbow delimiters to make lisp coding
;; as smooth as possible
;;

(defun gen-paredit-hook ()
  (paredit-mode +1))

(defun fix-paredit-delete ()
  (local-set-key (kbd "C-h") 'paredit-backward-delete))

(add-hook 'emacs-lisp-mode-hook 'gen-paredit-hook)
(add-hook 'paredit-mode-hook 'fix-paredit-delete)
(add-hook 'clojure-mode-hook 'gen-paredit-hook)
(add-hook 'clojure-mode-hook 'rainbow-delimiters-mode)
(add-hook 'clojure-test-mode-hook 'gen-paredit-hook)
(add-hook 'clojure-test-mode-hook 'rainbow-delimiters-mode)
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'cider-mode-hook 'gen-paredit-hook)
(add-hook 'cider-repl-mode-hook 'gen-paredit-hook)

;;(add-hook 'clojure-mode-hook 'local/pretty-fn)
;;(add-hook 'clojurescript-mode-hook 'local/pretty-fn)

(setq inferior-lisp-program "/usr/bin/sbcl")
(when (string-match "apple-darwin" system-configuration)
  (setq inferior-lisp-program "/usr/local/bin/sbcl"))

(setq scheme-program-name "csi -:c")
(require 'quack)
(setq scheme-program-name "csi -:c")

(define-key scheme-mode-map (kbd "C-c C-l") 'scheme-load-current-file)

(defun scheme-load-current-file (&optional switch)
  (interactive "P")
  (let ((file-name (buffer-file-name))) (scheme-load-file file-name)))

(add-hook 'scheme-mode-hook 'enable-paredit-mode)
(add-hook 'scheme-mode-hook 'rainbow-delimiters-mode-enable)

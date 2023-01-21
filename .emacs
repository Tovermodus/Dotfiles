(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-fuzzy-sorting-backend 'flx)
 '(custom-enabled-themes '(tango-dark))
 '(package-selected-packages
   '(markdown-preview-mode markdown-mode flycheck flx company-fuzzy helm-company smooth-scrolling outshine zoom helm-xref eglot multiple-cursors expand-region yasnippet-snippets yasnippet shx smex pomidor ivy-prescient swiper ivy which-key darkroom magit helm helm-swoop rainbow-delimiters company-tabnine company undo-tree))
 '(smooth-scroll-margin 5)
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(rainabow-delimiters-depth-1-face ((t (:foreground "White" :inherit rainbow-delimiters-base-face))))
 '(rainbow-delimiters-depth-2-face ((t (:inherit rainbow-delimiters-base-face :foreground "Yellow"))))
 '(rainbow-delimiters-depth-3-face ((t (:inherit rainbow-delimiters-base-face :foreground "Orange"))))
 '(rainbow-delimiters-depth-4-face ((t (:inherit rainbow-delimiters-base-face :foreground "Red"))))
 '(rainbow-delimiters-depth-5-face ((t (:inherit rainbow-delimiters-base-face :foreground "Magenta"))))
 '(rainbow-delimiters-depth-6-face ((t (:inherit rainbow-delimiters-base-face :foreground "Purple"))))
 '(rainbow-delimiters-depth-7-face ((t (:inherit rainbow-delimiters-base-face :foreground "Blue")))))

(setq backup-directory-alist
          `((".*" . ,"/home/tovermodus/.emacshist")))

(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(yas-global-mode 1)
(global-undo-tree-mode 1)
(global-company-mode 1)
(smooth-scrolling-mode 1)
(global-company-fuzzy-mode 1)
(global-display-line-numbers-mode 1)

(setq company-idle-delay 0)
;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

(setq helm-swoop-pre-input-function
      (lambda ()
        (if mark-active
            (buffer-substring-no-properties (mark) (point))
          "")))
(defun indent-buffer ()
  (interactive)
  (save-excursion
    (indent-region (point-min) (point-max) nil)))
(setq mac-option-modifier 'meta          
      mac-command-modifier 'super 
      mac-right-option-modifier 'none)

(defun delete-whole-line ()
  (interactive)
  (delete-region
   (progn (beginning-of-line 1) (point))
   (progn (end-of-line 1) (point)))
  (delete-char 1))

(defun delete-word-backwards ()
  (interactive)
  (delete-region (point) (progn (forward-word -1) (point))))

(defun kill-word-backwards ()
  (interactive)
  (kill-region (point) (progn (forward-word -1) (point))))

(global-set-key (kbd "M-S-<backspace>") 'kill-word-backwards)
(global-set-key (kbd "M-<backspace>") 'delete-word-backwards)
(global-set-key (kbd "s-S-<backspace>") 'kill-whole-line)
(global-set-key (kbd "s-<backspace>") 'delete-whole-line)
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-A") 'smex) ;;cmd shift a
(global-set-key (kbd "s-b") 'switch-to-buffer)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-u") 'undo-tree-visualize)
(global-set-key (kbd "s-r") 'query-replace)
(global-set-key (kbd "s-f") 'helm-swoop)
(global-set-key (kbd "s-F") 'helm-multi-swoop-all)
(global-set-key (kbd "s-g") 'isearch-repeat-forward)
(global-set-key (kbd "s-o") 'other-window)
(global-set-key (kbd "s-n") 'find-file)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-w") 'kill-buffer)
(global-set-key (kbd "s-q") 'save-buffers-kill-emacs)
(global-set-key (kbd "s-l") 'goto-line)
(global-set-key (kbd "s-k") 'kill-buffer)
(global-set-key (kbd "s-/") 'comment-line)
(global-set-key (kbd "M-S-<mouse-1>")    'mc/add-cursor-on-click)
(global-set-key (kbd "M-s-<up>")    'beginning-of-buffer)
(global-set-key (kbd "M-s-<down>")  'end-of-buffer)
(global-set-key (kbd "s-<left>")  'beginning-of-line)
(global-set-key (kbd "s-<right>") 'end-of-line)
(global-set-key (kbd "s-<down>")     'forward-paragraph)
(global-set-key (kbd "s-<up>")       'backward-paragraph)
(global-set-key [(meta up)]       'er/expand-region)
(global-set-key (kbd "s-<mouse-1>") 'xref-find-references-at-mouse)
(global-set-key (kbd "M-s-l") 'indent-buffer)


(global-set-key (kbd "<f5>") 'my-compile)
(global-set-key (kbd "<f9>") 'my-execute)



(add-hook 'python-moe-hook 'eglot-ensure)
(add-hook 'eglot-managed-mode-hook
	  (lambda ()
	    (define-key eglot-mode-map (kbd "S-<f6>") 'eglot-rename)
	    (define-key eglot-mode-map (kbd "M-s-l") 'eglot-format-buffer)
	    (define-key eglot-mode-map (kbd "M-s-o") 'eglot-code-action-organize-imports)))

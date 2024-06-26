;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Phabiann-Ross De Carvalho"
      user-mail-address "prdecarvalho96@outlook.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "JetBrains Mono" :size 13 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Cantarell" :size 14))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/OneDrive/Notes")
(setq org-roam-directory "~/OneDrive/Notes/Roam")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.


(setq gdscript-godot-executable "/home/prdecarvalho/.local/share/Steam/steamapps/common/Godot Engine/godot.x11.opt.tools.64")
(setq langtool-language-tool-jar "/home/menwhorust/LanguageTool-6.3-stable/languagetool-commandline.jar")


(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)

(elcord-mode)
(setq! elcord-use-major-mode-as-main-icon t)

(setq ccm-recenter-at-end-of-file t)

;; Focus Mode color config
(custom-set-faces!
  `(focus-unfocused
    :foreground ,(doom-darken (face-attribute 'default :foreground)  0.6)))

;; Hooks
(after! writeroom-mode
  (add-hook 'writeroom-mode-enable-hook
            (lambda ()
              (when (derived-mode-p 'org-mode 'markdown-mode)
                (setq display-line-numbers nil)
                (centered-cursor-mode t)
                (focus-mode)
                )))
  (add-hook 'writeroom-mode-disable-hook
            (lambda ()
              (when (derived-mode-p 'org-mode 'markdown-mode)
                (setq display-line-numbers t)
                (centered-cursor-mode -1)
                (focus-mode -1)
                ))))



(map! :leader
      :desc "Focus open treemacs window if there is one"
      "o o" #'treemacs-select-window)


(setq dap-auto-configure-features '(sessions locals controls tooltip))

;; Maximize Emacs on startup
(add-to-list 'default-frame-alist '(fullscreen . maximized))


(map! :leader
      (:prefix ("l" . "LangTool")
       :desc "Check grammar" "c" #'langtool-check
       :desc "Next problem" "n" #'langtool-goto-next-error
       :desc "Previous problem" "p" #'langtool-goto-previous-error
       :desc "Finish chech" "f" #'langtool-check-done))



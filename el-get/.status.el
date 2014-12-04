((auctex status "installed" recipe
	 (:name auctex :website "http://www.gnu.org/software/auctex/" :description "AUCTeX is an extensible package for writing and formatting TeX files in GNU Emacs and XEmacs. It supports many different TeX macro packages, including AMS-TeX, LaTeX, Texinfo, ConTeXt, and docTeX (dtx files)." :type git :module "auctex" :url "git://git.savannah.gnu.org/auctex.git" :build
		`(("./autogen.sh")
		  ("./configure" "--without-texmf-dir" "--with-packagelispdir=$(pwd)" "--with-packagedatadir=$(pwd)" ,(cond
														       ((eq system-type 'darwin)
															"--with-lispdir=`pwd`")
														       (t ""))
		   ,(concat "--with-emacs=" el-get-emacs))
		  "make")
		:load-path
		("." "preview")
		:load
		("tex-site.el" "preview/preview-latex.el")
		:info "doc"))
 (auto-complete status "installed" recipe
		(:name auto-complete :website "https://github.com/auto-complete/auto-complete" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
		       (popup fuzzy)
		       :features auto-complete-config :post-init
		       (progn
			 (add-to-list 'ac-dictionary-directories
				      (expand-file-name "dict" default-directory))
			 (ac-config-default))))
 (auto-complete-auctex status "installed" recipe
		       (:name auto-complete-auctex :description "Auto-completion for AuCTeX." :type github :pkgname "monsanto/auto-complete-auctex" :depends
			      (auto-complete yasnippet)
			      :prepare
			      (autoload 'ac-auctex-setup "auto-complete-auctex")))
 (auto-complete-emacs-lisp status "installed" recipe
			   (:name auto-complete-emacs-lisp :description "Auto-complete sources for emacs lisp" :type http :url "http://www.cx4a.org/pub/auto-complete-emacs-lisp.el" :depends auto-complete))
 (auto-complete-yasnippet status "installed" recipe
			  (:name auto-complete-yasnippet :description "Auto-complete sources for YASnippet" :type http :url "http://www.cx4a.org/pub/auto-complete-yasnippet.el" :depends
				 (auto-complete yasnippet)))
 (autopair status "installed" recipe
	   (:name autopair :website "https://github.com/capitaomorte/autopair" :description "Autopair is an extension to the Emacs text editor that automatically pairs braces and quotes." :type github :pkgname "capitaomorte/autopair" :features autopair))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (color-theme status "installed" recipe
	      (:name color-theme :description "An Emacs-Lisp package with more than 50 color themes for your use. For questions about color-theme" :website "http://www.nongnu.org/color-theme/" :type http-tar :options
		     ("xzf")
		     :url "http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz" :load "color-theme.el" :features "color-theme" :post-init
		     (progn
		       (color-theme-initialize)
		       (setq color-theme-is-global t))))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:load "el-get.el"))
 (fuzzy status "installed" recipe
	(:name fuzzy :website "https://github.com/auto-complete/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (git-modes status "installed" recipe
	    (:name git-modes :description "GNU Emacs modes for various Git-related files" :type github :pkgname "magit/git-modes"))
 (org-mode status "installed" recipe
	   (:name org-mode :website "http://orgmode.org/" :description "Org-mode is for keeping notes, maintaining ToDo lists, doing project planning, and authoring with a fast and effective plain-text system." :type git :url "git://orgmode.org/org-mode.git" :info "doc" :build/berkeley-unix `,(mapcar
																																				       (lambda
																																					 (target)
																																					 (list "gmake" target
																																					       (concat "EMACS="
																																						       (shell-quote-argument el-get-emacs))))
																																				       '("oldorg"))
		  :build `,(mapcar
			    (lambda
			      (target)
			      (list "make" target
				    (concat "EMACS="
					    (shell-quote-argument el-get-emacs))))
			    '("oldorg"))
		  :load-path
		  ("." "contrib/lisp" "lisp")
		  :load
		  ("lisp/org-loaddefs.el")))
 (package status "installed" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
		 (progn
		   (let
		       ((old-package-user-dir
			 (expand-file-name
			  (convert-standard-filename
			   (concat
			    (file-name-as-directory default-directory)
			    "elpa")))))
		     (when
			 (file-directory-p old-package-user-dir)
		       (add-to-list 'package-directory-list old-package-user-dir)))
		   (setq package-archives
			 (bound-and-true-p package-archives))
		   (mapc
		    (lambda
		      (pa)
		      (add-to-list 'package-archives pa 'append))
		    '(("ELPA" . "http://tromey.com/elpa/")
		      ("melpa" . "http://melpa.org/packages/")
		      ("gnu" . "http://elpa.gnu.org/packages/")
		      ("marmalade" . "http://marmalade-repo.org/packages/")
		      ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (popup status "installed" recipe
	(:name popup :website "https://github.com/auto-complete/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :submodule nil :pkgname "auto-complete/popup-el"))
 (reftex status "installed" recipe
	 (:name reftex :description "Version and autoloads of RefTeX" :builtin "24.3" :type cvs :module "reftex" :url ":pserver:anonymous@cvs.sv.gnu.org:/sources/auctex" :build
		`(("make" ,(concat "EMACS=" el-get-emacs))
		  ("make" "info"))
		:features reftex :load-path
		("lisp")
		:info "doc"))
 (smex status "installed" recipe
       (:name smex :description "M-x interface with Ido-style fuzzy matching." :type github :pkgname "nonsequitur/smex" :features smex :post-init
	      (smex-initialize)))
 (yasnippet status "installed" recipe
	    (:name yasnippet :website "https://github.com/capitaomorte/yasnippet.git" :description "YASnippet is a template system for Emacs." :type github :pkgname "capitaomorte/yasnippet" :compile "yasnippet.el" :submodule nil :build
		   (("git" "submodule" "update" "--init" "--" "snippets")))))

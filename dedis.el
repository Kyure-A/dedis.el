;;; dedis.el --- detecting linux distribution  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Kyure_A

;; Author: Kyure_A <k@kyre.moe>
;; Keywords: tools

;; Version: 0.0.0
;; Package-Requires: ((emacs "24.1"))
;; URL: https://github.com/Kyure-A/dedis.el

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; detecting linux distribution

;;; Code:

(require 's)

(defgroup dedis ()
  "detecting linux distribution"
  :group 'tools
  :prefix "dedis-"
  :link '(url-link "https://github.com/Kyure-A/dedis.el"))

(defun dedis-get-distribution ()
  "Get Distribution."
  (interactive)
  (s-replace " " "" (s-collapse-whitespace (s-collapse-whitespace (shell-command-to-string "echo $(. /etc/os-release && echo $NAME)")))))

(defun dedis-get-install-command ()
  "Get install command."
  (let* ((command ""))
    (when (or (equal (dedis-get-distribution) "Arch Linux") (equal (dedis-get-distribution) "Manjaro Linux"))
      (setf command "pacman -S"))
    (when (or (equal (dedis-get-distribution) "Ubuntu") (equal (dedis-get-distribution) "Debian GNU/Linux"))
      (setf command "apt install"))
    (when (equal (dedis-get-distribution) "CentOS Linux")
      (setf command "yum install"))
    (when (equal (dedis-get-distribution) "Fedora")
      (setf command "dnf install"))
    command))

(defun dedis-get-package-install-command (package)
  "Generate install command for PACKAGE."
  (let* ((install-command (dedis-get-install-command)))
    (s-lex-format "${install-command} ${package}")))


(provide 'dedis)
;;; dedis.el ends here

;;; detecting-distro.el --- detecting linux distribution  -*- lexical-binding: t; -*-

;; Copyright (C) 2023  Kyure_A

;; Author: Kyure_A <k@kyre.moe>
;; Keywords: tools

;; Version: 0.0.0
;; Package-Requires: ((emacs "24.1"))
;; URL: https://github.com/Kyure-A/detecting-distro.el

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

(defgroup detecting-distro ()
  "detecting linux distribution"
  :group 'tools
  :prefix "detecting-distro-"
  :link '(url-link "https://github.com/Kyure-A/detecting-distro.el"))

(defun detecting-distro-get-distro ()
  "Get Distro."
  (s-replace " " "" (s-collapse-whitespace (s-collapse-whitespace (shell-command-to-string "echo $(. /etc/os-release && echo $NAME)")))))

(defun detecting-distro-hoge ()
  "Hoge Distro."
  (when (equal (detecting-distro-get-distro) "Ubuntu")
    "apt install")
  (when (equal (detecting-distro-get-distro) "Arch Linux")
    "pacman -S")

  (provide 'detecting-distro)
;;; detecting-distro.el ends here

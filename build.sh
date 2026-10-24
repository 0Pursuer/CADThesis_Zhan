#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"
command -v latexmk >/dev/null || { echo 'Please install a TeX distribution with XeLaTeX and latexmk.' >&2; exit 1; }
latexmk -xelatex -interaction=nonstopmode -file-line-error -halt-on-error main.tex

#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

for cv in cv_en cv_pt; do
	xelatex -shell-escape -interaction=nonstopmode -halt-on-error "${cv}.tex"
	biber "$cv"
	xelatex -shell-escape -interaction=nonstopmode -halt-on-error "${cv}.tex"
	xelatex -shell-escape -interaction=nonstopmode -halt-on-error "${cv}.tex"
done

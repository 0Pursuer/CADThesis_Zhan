@echo off
chcp 65001 >nul
cd /d "%~dp0"
latexmk -xelatex -interaction=nonstopmode -file-line-error -halt-on-error main.tex
if errorlevel 1 (
  echo Build failed. Please check main.log.
  exit /b 1
)
echo Built: main.pdf

@echo off
setlocal

:: === Configura aqui tu repo real (ya lo pongo con tu usuario) ===
set "REMOTE=https://github.com/nataliogc/menus-cocteles.git"
set "BRANCH=main"

where git >nul 2>nul || (
  echo [ERROR] Git no esta instalado en el PATH.
  pause
  exit /b 1
)

echo === Mostrando remotos actuales ===
git remote -v || echo (aun no hay remotos)

echo.
echo === Creando rama y primer commit si hiciera falta ===
git rev-parse --verify %BRANCH% >nul 2>nul
if errorlevel 1 (
  git checkout -b %BRANCH%
) else (
  git checkout %BRANCH%
)

git add -A
git commit -m "fix: set remote origin and push" || echo (nada que commitear)

echo.
echo === Ajustando remoto 'origin' ===
git remote get-url origin >nul 2>nul
if errorlevel 1 (
  git remote add origin "%REMOTE%"
) else (
  git remote set-url origin "%REMOTE%"
)

echo.
echo === Probando push ===
git push -u origin %BRANCH%

echo.
echo Listo. Remoto actual:
git remote -v
echo.
echo Abre: https://nataliogc.github.io/menus-cocteles/
pause
endlocal

@echo off
setlocal
set "MSG=%*"
if "%MSG%"=="" set "MSG=update: sincroniza y sube"

where git >nul 2>nul || (
  echo [ERROR] Git no esta instalado en el PATH.
  pause
  exit /b 1
)

git rev-parse --verify main >nul 2>nul
if errorlevel 1 ( git checkout -b main ) else ( git checkout main )

echo.
echo === Sincronizando con remoto (pull --rebase) ===
git fetch origin
git pull --rebase origin main
if errorlevel 1 (
  echo.
  echo [AVISO] Hay conflictos. Resuelvelos y luego:
  echo     git add -A
  echo     git rebase --continue
  echo y ejecuta este .bat de nuevo.
  pause
  exit /b 1
)

echo.
echo === Añadiendo cambios locales ===
git add -A

echo.
echo === Commit ===
git commit -m "%MSG%" || echo (nada nuevo que commitear)

echo.
echo === Push ===
git push origin main

echo.
echo OK ✓ Publicado: https://nataliogc.github.io/menus-cocteles/
pause
endlocal

@echo off
setlocal
set "MSG=%*"
if "%MSG%"=="" set "MSG=update: cambios en cocteles"

where git >nul 2>nul || (
  echo [ERROR] Git no esta instalado en el PATH.
  pause
  exit /b 1
)

echo.
echo === Añadiendo todos los cambios ===
git add -A

echo.
echo === Commit ===
git commit -m "%MSG%" || echo (nada nuevo que commitear)

echo.
echo === Push a GitHub ===
git push origin main

echo.
echo Cambios subidos a: https://nataliogc.github.io/menus-cocteles/
pause
endlocal

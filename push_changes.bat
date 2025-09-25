@echo off
setlocal
set "MSG=%*"
if "%MSG%"=="" set "MSG=update: cambios en cocteles"

where git >nul 2>nul || (
  echo [ERROR] Git no esta instalado en el PATH.
  pause
  exit /b 1
)

REM Asegura que estamos en main
git rev-parse --verify main >nul 2>nul
if errorlevel 1 ( git checkout -b main ) else ( git checkout main )

REM Comprueba remoto y corrige si aun es placeholder
for /f "tokens=*" %%i in ('git remote get-url origin 2^>nul') do set REMOTE=%%i
if "%REMOTE%"=="" (
  git remote add origin https://github.com/nataliogc/menus-cocteles.git
) else (
  echo Remoto actual: %REMOTE%
  echo %REMOTE% | find "TU_USUARIO_GITHUB" >nul
  if not errorlevel 1 git remote set-url origin https://github.com/nataliogc/menus-cocteles.git
)

echo.
echo === Añadiendo todos los cambios ===
git add -A

echo.
echo === Commit ===
git commit -m "%MSG%" || echo (nada nuevo que commitear)

echo.
echo === Push a GitHub ===
git push -u origin main

echo.
echo OK ✓ Cambios subidos a: https://nataliogc.github.io/menus-cocteles/
pause
endlocal

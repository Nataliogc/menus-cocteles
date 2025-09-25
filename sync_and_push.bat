@echo off
setlocal
set "MSG=%*"
if "%MSG%"=="" set "MSG=update: cambios en cocteles"

where git >nul 2>nul || (
  echo [ERROR] Git no esta instalado en el PATH.
  pause
  exit /b 1
)

echo === Verificando rama 'main' ===
git rev-parse --verify main >nul 2>nul
if errorlevel 1 ( git checkout -b main ) else ( git checkout main )

echo.
echo === Sincronizando con remoto (pull --rebase) ===
git fetch origin
git pull --rebase origin main
if errorlevel 1 (
  echo.
  echo [AVISO] Hubo conflictos o error al rebasar.
  echo - Si hay conflictos, resuelvelos en tus archivos y ejecuta:
  echo     git add -A
  echo     git rebase --continue
  echo - Luego vuelve a ejecutar este .bat
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
if errorlevel 1 (
  echo.
  echo [ERROR] No se pudo hacer push. Revisa el mensaje anterior.
  pause
  exit /b 1
)

echo.
echo OK ✓ Cambios publicados: https://nataliogc.github.io/menus-cocteles/
pause
endlocal

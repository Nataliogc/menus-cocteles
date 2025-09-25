@echo off
setlocal

where git >nul 2>nul || (
  echo [ERROR] Git no esta instalado en el PATH.
  pause
  exit /b 1
)

echo === ADVERTENCIA ===
echo Esto sobrescribira el remoto con tu copia local.
choice /M "Continuar"
if errorlevel 2 ( echo Cancelado. & pause & exit /b 0 )

git checkout main
git add -A
git commit -m "force: sobrescribir remoto con local" || echo (nada que commitear)
git push --force-with-lease origin main

echo.
echo OK ✓ Forzado. Revisa: https://nataliogc.github.io/menus-cocteles/
pause
endlocal

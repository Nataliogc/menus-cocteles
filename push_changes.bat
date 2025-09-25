@echo off
setlocal
set "MSG=%*"
if "%MSG%"=="" set "MSG=update: cambios rapidos"

where git >nul 2>nul || (
  echo [ERROR] Git no esta instalado en el PATH.
  pause
  exit /b 1
)

echo.
echo === Añadiendo cambios ===
git add -A
echo.
echo === Commit ===
git commit -m "%MSG%" || echo (nada que commitear)
echo.
echo === Push ===
git push
echo.
echo Hecho.
pause
endlocal

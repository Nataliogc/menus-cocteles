@echo off
setlocal ENABLEDELAYEDEXPANSION

:: ============================
:: CONFIGURACIÓN (edita esto)
:: ============================
set "GITHUB_USER=TU_USUARIO_GITHUB"
set "REPO_NAME=menus-cocteles"
set "DEFAULT_BRANCH=main"
:: Si ya creaste el repo en GitHub (vía web), deja REMOTE_URL así:
set "REMOTE_URL=https://github.com/%GITHUB_USER%/%REPO_NAME%.git"
:: ============================

echo.
echo === Comprobando que Git esta instalado ===
where git >nul 2>nul || (
  echo [ERROR] No se encontro Git en el PATH. Instala Git y vuelve a ejecutar.
  pause
  exit /b 1
)

echo.
echo === Preparando archivos ===
:: Si no existe index.html pero existe coctel.html, creamos index.html
if not exist "index.html" (
  if exist "coctel.html" (
    copy /Y "coctel.html" "index.html" >nul
    echo Copiado coctel.html -> index.html
  )
)

if not exist "index.html" (
  echo [ERROR] No se encontro index.html ni coctel.html.
  pause
  exit /b 1
)

:: Opcional: crear README minimo si no existe
if not exist "README.md" (
  > "README.md" echo # Generador de cocteles
  >>"README.md" echo Publicado con GitHub Pages.
)

:: Crear .gitignore basico (no es obligatorio)
if not exist ".gitignore" (
  > ".gitignore" echo Thumbs.db
  >>".gitignore" echo .DS_Store
)

echo.
echo === Inicializando repositorio local ===
if not exist ".git" (
  git init
  git branch -M %DEFAULT_BRANCH%
)

echo.
echo === Añadiendo archivos ===
git add index.html coctel.html README.md .gitignore 2>nul
git add *.png *.jpg *.jpeg 2>nul

echo.
echo === Commit inicial ===
git commit -m "Initial commit: Generador de cocteles v5.8" || echo (posiblemente ya hay un commit)

:: Si no existe el remoto 'origin', lo creamos (dos opciones: con gh o URL fija)
echo.
echo === Configurando remoto ===
git remote get-url origin >nul 2>nul
if errorlevel 1 (
  :: ¿Tienes la CLI de GitHub 'gh'? Si si, creamos el repo automaticamente.
  where gh >nul 2>nul
  if not errorlevel 1 (
    echo Se detecto GitHub CLI. Creando repo remoto...
    gh repo create "%GITHUB_USER%/%REPO_NAME%" --public --source . --remote origin --push
  ) else (
    echo No se detecto GitHub CLI. Usando URL configurada.
    git remote add origin "%REMOTE_URL%"
    git push -u origin %DEFAULT_BRANCH%
  )
) else (
  echo Remoto origin ya existe.
  git push -u origin %DEFAULT_BRANCH%
)

:: Activar GitHub Pages con gh (opcional pero recomendado)
where gh >nul 2>nul
if not errorlevel 1 (
  echo.
  echo === Activando GitHub Pages (branch: %DEFAULT_BRANCH%, path: /) ===
  rem Intenta crear/ajustar Pages via API (ignora error si ya existe)
  gh api repos/%GITHUB_USER%/%REPO_NAME%/pages --method POST ^
    -H "Accept: application/vnd.github+json" ^
    -f "source[branch]=%DEFAULT_BRANCH%" -f "source[path]=/" >nul 2>nul

  rem A veces requiere PATCH si existe: lo intentamos tambien (silencioso)
  gh api repos/%GITHUB_USER%/%REPO_NAME%/pages --method PATCH ^
    -H "Accept: application/vnd.github+json" ^
    -f "source[branch]=%DEFAULT_BRANCH%" -f "source[path]=/" >nul 2>nul

  echo Listo. Si da error, puedes activar Pages manualmente en Settings > Pages.
)

echo.
echo === Todo listo ===
echo URL (cuando Pages este activo): https://%GITHUB_USER%.github.io/%REPO_NAME%/
echo (si subiste index.html cargara directo; si no, usa /coctel.html)
echo.
pause
endlocal

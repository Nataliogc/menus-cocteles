# 📋 Registro de Versiones y Control de Cambios - Menús Cócteles

Este documento mantiene el historial oficial de versiones, estado de los módulos y fechas de actualización del sistema **Menús Cócteles** bajo un **esquema de versión única para todo el proyecto**.

> **Regla de versión unificada:**
> Todo el sistema comparte un **único número de versión global**. Cada vez que se realice cualquier modificación en cualquier módulo, archivo o funcionalidad (código HTML/JS/CSS, imágenes, scripts o documentación):
> 1. Se **incrementará la versión global** de todo el sistema.
> 2. Se actualizará la **fecha de actualización** en este registro y en las etiquetas correspondientes de [`index.html`](file:///c:/Users/comun/Documents/GitHub/menus-cocteles/index.html) (`<title>`, `<meta name="version">` y `<meta name="last-modified">`).
> 3. Se añadirá una entrada en el **Historial de Cambios** detallando los módulos afectados y las modificaciones efectuadas.

---

## 📌 Estado Actual del Sistema

| Parámetro | Valor Actual |
| :--- | :--- |
| **Versión Global del Sistema** | `v5.8` |
| **Fecha de Última Actualización** | 27/10/2026 |
| **Estado General** | En Producción / Operativo |
| **Despliegue GitHub Pages** | [https://nataliogc.github.io/menus-cocteles/](https://nataliogc.github.io/menus-cocteles/) |

---

## 📦 Módulos y Componentes del Sistema

Todos los siguientes componentes quedan unificados bajo la versión global actual:

| Componente / Módulo | Archivos Asociados | Descripción |
| :--- | :--- | :--- |
| **Aplicación Principal / Visor** | [`index.html`](file:///c:/Users/comun/Documents/GitHub/menus-cocteles/index.html) | Interfaz de edición de menús de cóctel, maquetación A4 para impresión, cálculo de alérgenos y exportación a PDF / imagen. |
| **Recursos Gráficos y Portadas** | `Portada Guadiana.png`, `Portada Cumbria.png`, `Portada Combinada.png`, `Guadina.png`, `cumbria.png`, `Alergenos.jpg` | Cabeceras corporativas, fondos de portada completa y franja inferior con simbología de alérgenos. |
| **Identidad Visual** | `favicon.png`, `icon.png`, `Coctel.ico`, `Coctel.jpg` | Iconos del navegador, accesos directos y miniaturas del sistema. |
| **Scripts de Sincronización y Git** | `push_changes.bat`, `sync_and_push.bat`, `status_check.bat`, `force_push.bat` | Scripts por lotes para automatización de control de versiones y publicación en GitHub Pages. |
| **Documentación** | [`README.md`](file:///c:/Users/comun/Documents/GitHub/menus-cocteles/README.md), [`REGISTRO_VERSIONES.md`](file:///c:/Users/comun/Documents/GitHub/menus-cocteles/REGISTRO_VERSIONES.md) | Guías de uso, despliegue y control unificado de versiones. |

---

## 📝 Historial Detallado de Versiones

### [v5.8] - 27/10/2026
- **Tipo de cambio**: Establecimiento de versión única y creación de registro.
- **Detalle de cambios**:
  - Unificación de la versión de todo el sistema en una sola (`v5.8`), alineada con la versión base de la aplicación.
  - Creación y formalización de [`REGISTRO_VERSIONES.md`](file:///c:/Users/comun/Documents/GitHub/menus-cocteles/REGISTRO_VERSIONES.md).
  - Adopción de la norma: cualquier cambio en cualquier módulo incrementa la versión global de todo el sistema.

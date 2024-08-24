@echo off
setlocal enabledelayedexpansion

echo Compilando...

:: Comprobar si el archivo de configuración existe
if exist config/config.properties (
    echo Leyendo archivo de configuracion...
    :: Leer el archivo de configuración
    for /f "tokens=1,2 delims==" %%a in (config/config.properties) do (
        if "%%a"=="ZXBC_PATH" set ZXBC_PATH=%%b
    )
    
    :: Usar el path importado
    !ZXBC_PATH! -t -B -a parser.bas
) else (
    echo Error: El archivo de configuración config/config.properties no existe.
    exit /b 1
)
set InpExt=i
set OutExt=o
set RstExt=r
set salExt=st
set ScnExt=scn
set Carpeta=Relap


goto Inicia
:Continua
echo Deleting files: "%input%.%OutExt%" "%input%.%salExt%" "%input%.%ScnExt%" ...
del "..\%input%.%OutExt%" "..\%input%.%salExt%" "..\%input%.%ScnExt%">nul 2>&1
del "..\%input%.%RstExt%" >nul 2>&1
del "read_steam_comment.o" screen>nul 2>&1
echo Running the input: "%input%.%InpExt%" ...
echo.

echo -----------------------------------------------------------------------------------------------------------------------------------------------------
::start /B /wait /abovenormal /affinity F relap5.x -i "..\%input%.%InpExt%" -o "..\%input%.%OutExt%" -r "..\%input%.%RstExt%" -s "..\%input%.%salExt%"
start /B /wait /normal relap5l2 -i "..\%input%.%InpExt%" -o "..\%input%.%OutExt%" -r "..\%input%.%RstExt%" -s "..\%input%.%salExt%"
echo -----------------------------------------------------------------------------------------------------------------------------------------------------

move screen "..\%input%.%ScnExt%">nul 2>&1
del read_steam_comment.o>nul 2>&1
goto Salir


::--------------------------------------------------------------------------------------------------------------------------
:Inicia
set Nucleo=4
Color 0F 
@echo off & setlocal EnableDelayedExpansion
mode con: cols=150 lines=15

if not exist %Carpeta% (
echo The folder "%Carpeta%" does not existe
goto Salir
)
cd %Carpeta% >nul 2>&1
dir ..\ /B > ListaArchivos
set CantInp=0
for /F "tokens=1* delims=." %%I in ('findstr /I /E /c:".%InpExt%" ListaArchivos') do set /A CantInp=CantInp+1
if %CantInp% GTR 1 goto MasQueUno
for /F "tokens=* delims=." %%I in ('findstr /I /E /c:".%InpExt%" ListaArchivos') do set input=%%I
:SigueInicio
::set input=%input%
set input=!input:.%InpExt%=!

title Corriendo el input: %input% desde las %TIME% del dia %DATE% en el Nucleo %Nucleo%
del ListaArchivos>nul 2>&1
goto Continua
::--------------------------------------------------------------------------------------------------------------------------

::--------------------------------------------------------------------------------------------------------------------------
:MasQueUno
set CantInp=0
echo The inputs founded are:
for /F "tokens=1* delims=." %%I in ('findstr /I /E /c:".%InpExt%" ListaArchivos') do (
set /A CantInp=CantInp+1
echo !CantInp! - %%I.%%J
)
:EligeInp
set /p NInp=Cual de los input's mostrados desea correr?: 
if %NInp% GTR %CantInp% (goto EligeInp) ELSE (if %NInp% LSS 1 goto EligeInp)
set CantInp=0
for /F "tokens=* delims=." %%I in ('findstr /I /E /c:".%InpExt%" ListaArchivos') do (
set /A CantInp=CantInp+1
if !CantInp!==%NInp% set input=%%I
)
echo.
goto SigueInicio
::--------------------------------------------------------------------------------------------------------------------------


::--------------------------------------------------------------------------------------------------------------------------
:Salir
echo.
echo --- Execution finished ---
echo --- Press anything to close this window ---
pause>nul
exit /B
::--------------------------------------------------------------------------------------------------------------------------
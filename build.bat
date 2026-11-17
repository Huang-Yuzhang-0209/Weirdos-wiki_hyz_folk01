@echo off
chcp 65001 >nul
setlocal
cd /d "%~dp0"
set PYTHONUTF8=1
set PYTHONIOENCODING=utf-8

echo.
echo ========================================
echo   神人百科 / 正在生成网页
echo ========================================
echo.

where py >nul 2>nul
if errorlevel 1 goto python_fallback
py -3 build.py
goto check_result

:python_fallback
python build.py

:check_result
if errorlevel 1 (
  echo.
  echo [失败] 网页没有生成。请查看上面的提示。
  echo.
  pause
  exit /b 1
)

echo.
echo [完成] 正在打开 dist\index.html
start "" "dist\index.html"
endlocal

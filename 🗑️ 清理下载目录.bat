@echo off
setlocal enabledelayedexpansion
chcp 65001 >nul
cd /d "%~dp0"

echo.
echo ═══════════════════════════════════════════════════════════════
echo   🗑️  一键清理下载目录
echo ═══════════════════════════════════════════════════════════════
echo.

set "CONFIG_FILE=server\config.json"
set "DOWNLOADS_DIR="

:: 检查配置文件是否存在
if not exist "%CONFIG_FILE%" (
    echo ⚠️  配置文件不存在，使用默认路径
    set "DOWNLOADS_DIR=server\Downloads"
) else (
    echo 📖 正在读取配置文件...
    
    :: 使用PowerShell读取JSON配置
    for /f "delims=" %%i in ('powershell -Command "$config = Get-Content '%CONFIG_FILE%' -Raw | ConvertFrom-Json; $config.downloadsPath"') do set "DOWNLOADS_DIR=%%i"
    
    if "!DOWNLOADS_DIR!"=="" (
        echo ⚠️  配置文件中未找到下载路径，使用默认路径
        set "DOWNLOADS_DIR=server\Downloads"
    ) else (
        echo ✅ 读取到下载路径：!DOWNLOADS_DIR!
    )
)

echo.

:: 检查下载目录是否存在
if not exist "!DOWNLOADS_DIR!" (
    echo ❌ 下载目录不存在：!DOWNLOADS_DIR!
    echo.
    pause
    exit /b
)

:: 统计文件和文件夹数量
set /a file_count=0
set /a folder_count=0

for %%f in ("!DOWNLOADS_DIR!\*") do set /a file_count+=1
for /d %%d in ("!DOWNLOADS_DIR!\*") do set /a folder_count+=1

echo 📊 当前下载目录状态：
echo    位置：!DOWNLOADS_DIR!
echo    文件数量：!file_count! 个
echo    文件夹数量：!folder_count! 个
echo.

if !file_count!==0 if !folder_count!==0 (
    echo ✅ 下载目录已经是空的，无需清理
    echo.
    pause
    exit /b
)

echo ⚠️  警告：此操作将删除下载目录中的所有文件和文件夹！
echo.

choice /C YN /M "确定要清理吗"
if errorlevel 2 (
    echo.
    echo ❌ 已取消清理
    echo.
    pause
    exit /b
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo   🗑️  正在清理...
echo ═══════════════════════════════════════════════════════════════
echo.

:: 删除所有文件
set /a deleted_files=0
for %%f in ("!DOWNLOADS_DIR!\*.*") do (
    del /f /q "%%f" 2>nul
    if !errorlevel!==0 (
        echo ✅ 已删除文件: %%~nxf
        set /a deleted_files+=1
    ) else (
        echo ⚠️  删除失败: %%~nxf
    )
)

:: 删除所有文件夹
set /a deleted_folders=0
for /d %%d in ("!DOWNLOADS_DIR!\*") do (
    rmdir /s /q "%%d" 2>nul
    if !errorlevel!==0 (
        echo ✅ 已删除文件夹: %%~nxd
        set /a deleted_folders+=1
    ) else (
        echo ⚠️  删除失败: %%~nxd
    )
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo   ✅ 清理完成！
echo ═══════════════════════════════════════════════════════════════
echo.

echo 📊 清理统计：
echo    已删除文件：!deleted_files! 个
echo    已删除文件夹：!deleted_folders! 个
echo.

:: 检查是否清理干净
set /a remaining_count=0
for %%f in ("!DOWNLOADS_DIR!\*") do set /a remaining_count+=1
for /d %%d in ("!DOWNLOADS_DIR!\*") do set /a remaining_count+=1

if !remaining_count!==0 (
    echo ✅ 下载目录已完全清空
) else (
    echo ⚠️  仍有 !remaining_count! 个项目未删除
    echo    可能是因为文件正在使用或权限不足
)

echo.
echo ═══════════════════════════════════════════════════════════════
echo.

choice /C YN /M "是否打开下载目录查看"
if errorlevel 1 if not errorlevel 2 (
    explorer "!DOWNLOADS_DIR!"
)

echo.
pause


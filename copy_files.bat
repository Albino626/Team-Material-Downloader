@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion

set "SOURCE_DIR=%~dp0"
set "TARGET_DIR=%SOURCE_DIR%团队素材下载工具V1.0.0"

echo 正在创建目标文件夹...
if not exist "%TARGET_DIR%" mkdir "%TARGET_DIR%"

echo 正在复制文件...
copy /Y "%SOURCE_DIR%index.html" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%logo.png" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%plugin.json" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%preload.js" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%README.md" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%README_CN.md" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%DISCLAIMER.md" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%LICENSE" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%Dockerfile" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%docker-compose.yml" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%.dockerignore" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%DOCKER.md" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%CONTRIBUTING.md" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%更新日志.md" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%远程服务器部署指南.md" "%TARGET_DIR%\" >nul
copy /Y "%SOURCE_DIR%.gitignore" "%TARGET_DIR%\" >nul 2>nul

echo 正在复制其他文件...
for %%f in ("%SOURCE_DIR%*.txt" "%SOURCE_DIR%*.bat") do (
    copy /Y "%%f" "%TARGET_DIR%\" >nul
)

echo 正在复制server文件夹...
xcopy /E /I /Y "%SOURCE_DIR%server" "%TARGET_DIR%\server" >nul

echo.
echo 复制完成！
echo 目标文件夹: %TARGET_DIR%
pause


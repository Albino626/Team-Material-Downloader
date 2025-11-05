@echo off
chcp 65001 >nul
echo 正在复制文件到"团队素材下载工具V1.0.0"文件夹...

if not exist "团队素材下载工具V1.0.0" mkdir "团队素材下载工具V1.0.0"

xcopy /E /I /Y *.* "团队素材下载工具V1.0.0\" /EXCLUDE:exclude_list.txt

echo.
echo 复制完成！
echo.
pause


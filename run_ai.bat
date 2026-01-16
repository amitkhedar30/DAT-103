@echo off
d:
cd "D:\projects\DAT-103"
docker run -it -p 8888:8888 -v "%cd%":/app ai-project-image
pause
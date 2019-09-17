REM copy files
xcopy e:\doc\py\py.md py\ /y
xcopy e:\doc\py\auto.md py\ /y
xcopy e:\doc\py\spider.md py /y
xcopy e:\doc\linux\linux.md linux /y
xcopy e:\doc\*.* .\ /y
xcopy e:\doc\english\*.md english\ /y
xcopy e:\doc\english\大学英语精读\*.md english\大学英语精读\ /y

: git init

: add files
git add .

rem commit
git commit -m "%date% %time%"
: git remote add origin origin git@github.com:xiao2752271456/document.git
: git push -u origin master
git push origin master

pause
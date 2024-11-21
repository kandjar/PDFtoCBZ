@Echo Off
echo ******************
echo      PDFtoCBZ     
echo ******************
FOR /R "pdf" %%F in (*.pdf) do (
	MKDIR "tmp\%%~nF" >nul
	echo %%~nF in process, please wait...
	pdfimages.exe -j -q "%%F" "%~dp0\tmp\%%~nF\%%~nF" >nul
	"C:\Program Files\7-Zip\7z.exe" a -tzip "%~dp0\tmp\%%~nF.cbz" "%~dp0tmp\%%~nF\*.*" >nul
	MOVE "%%F" "pdf done" >nul
	MOVE "%~dp0\tmp\%%~nF.cbz" "%~dp0\cbz\%%~nF.cbz" >nul
	RMDIR /S /Q "%~dp0tmp\%%~nF" >nul
	echo Done
	echo __________
	)

:end
pause
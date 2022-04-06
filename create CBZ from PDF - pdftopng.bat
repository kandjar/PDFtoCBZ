@Echo Off 
FOR /R "%~dp0" %%F in (*.pdf) do (
	MKDIR "%%~nF"
	echo "%~dp0\%%~nF\%%~nF"
	pdftopng.exe -aa no -aaVector no -q "%%F" "%~dp0\%%~nF\%%~nF"
	)
FOR /D /r %%G in (*) DO (
	:: Don't forget to change your drive name if 7zip is not stored at "C:\"
	"C:\Program Files\7-Zip\7z.exe" a -tzip "%%~nxG.cbz" "%%~nxG\*.*"
	RMDIR /S /Q "%%~nxG"
	)

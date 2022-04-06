@Echo Off 
FOR /R "%~dp0" %%F in (*.pdf) do (
	MKDIR "%%~nF"
	p2j.exe "%%F" /NOASK
	MOVE "%~dp0\PDF_to_JPG_files\*" "%~dp0\%%~nF"
	RMDIR /S /Q "%~dp0\PDF_to_JPG_files"
	)
	
FOR /D /r %%G in (*) DO (
	:: Don't forget to change your drive name if 7zip is not stored at "C:\"
	"C:\Program Files\7-Zip\7z.exe" a -tzip "%%~nxG.cbz" "%%~nxG\*.*"
	RMDIR /S /Q "%%~nxG"
	)

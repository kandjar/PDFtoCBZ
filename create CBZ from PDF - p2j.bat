@Echo Off 
FOR /R "%~dp0" %%F in (*.pdf) do (
	MKDIR "%%~nF"
	p2j.exe "%%F" /NOASK
	MOVE "%~dp0\PDF_to_JPG_files\*" "%~dp0\%%~nF"
	RMDIR /S /Q "%~dp0\PDF_to_JPG_files"
	)
	
FOR /D /r %%G in (*) DO (
	7za.exe a -tzip "%%~nxG.cbz" "%%~nxG\*.*"
	RMDIR /S /Q "%%~nxG"
	)
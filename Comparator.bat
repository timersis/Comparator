@ECHO OFF
CLS
color 0E
TITLE [TEST / OP]
CALL :MAIN 1


:INFO
ECHO #######################
ECHO.
ECHO DAY   :%DATE%
ECHO USER  :%USERNAME%
ECHO PC    :%USERDOMAIN%
ECHO.
ECHO #######################
EXIT /B 0

:NAME
ECHO.
ECHO **********************
ECHO *                    *
ECHO *     Comparator     *
ECHO *                    *
ECHO **********************
ECHO.
ECHO NOTE: the files must be in the same directory
ECHO.
EXIT /B 0

 
:MAIN 
	IF "%~1" EQU "1" (
		CALL :INFO
		CALL :NAME
		CALL :FILE
	)
	CALL :MENU
	CALL :CHOICE
	CALL :MAIN 0 

EXIT /B %ERRORLEVEL%

:FILE
	ECHO Please insert the filenames you want to compare or Ctrl+c to exit
	SET /P file1=Type file name 1: 
	SET /P file2=Type file name 2: 
	IF EXIST "%file1%" (
		IF EXIST "%file2%" (
			ECHO.
			ECHO *Files exist
		)
	) ELSE (
		ECHO.
		ECHO *Files do not exist
		ECHO.
		CALL :FILE
	)
	
EXIT /B 0

:MENU
	ECHO.
	ECHO -----------MENU-----------
	ECHO.
	ECHO   [1] ASCII comparison
	ECHO   [2] Binary comparison
	ECHO   [3] Unicode text files
	ECHO   [4] Give new files
	ECHO   [5] Creators
	ECHO   [6] EXIT
	ECHO.
EXIT /B 0

:CHOICE
	SET /P A=choose from menu: 
	ECHO.
	IF /I "%A%" EQU "1" (
		call :ASCII
	)
	IF /I "%A%" EQU "2" (
		call :BINARY
	)
	IF /I "%A%" EQU "3" (
		call :UNICODE
	)
	IF /I "%A%" EQU "4" (
		CLS
		CALL :INFO
		CALL :NAME
		call :FILE
	)
	IF /I "%A%" EQU "5" (
		call :CREATORS
	)
	IF /I "%A%" EQU "6" (
		EXIT
	)
EXIT /B 0


:ASCII
	fc /n "%file1%" "%file2%"
	PAUSE
EXIT /B 0

:BINARY
	fc /b "%file1%" "%file2%"
	PAUSE
EXIT /B 0

:UNICODE
	fc /u "%file1%" "%file2%"
	PAUSE
EXIT /B 0



:CREATORS
	ECHO.
	ECHO ========================
	ECHO           xxx
	ECHO 	 RAKIPI ALEXANDROS
	ECHO           yyy
	ECHO ========================
	timeout 30
EXIT /B 0


@ECHO OFF

REM Command file for MKDocs documentation

if "%RUNAPP%" == "" (
	set RUNAPP=mkdocs
)

if "%1" == "" goto help

if "%1" == "help" (
	:help
	echo.Please use `make ^<target^>` where ^<target^> is one of
	echo.  build    build this package
	echo.  check    check package
	echo.  clean    delete tmp files
	echo.  install  install this package
	echo.  run      run this package
	echo.  upload   upload this package to pypi

	goto end
)

if "%1" == "build" (
    python -m build
    goto end
)

if "%1" == "clean" (
    rd /s /q dist
    rd /s /q src\smallfileserver.egg-info
    goto end
)

if "%1" == "install" (
    pip install .
    goto end
)

if "%1" == "check" (
    twine check dist/*
    goto end
)

if "%1" == "upload" (
    twine upload dist/*
    goto end
)

if "%1" == "run" (
    python -m simplefileserver
    goto end
)


:end

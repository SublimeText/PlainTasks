@echo off
setlocal
chcp 65001 >nul
pushd %~dp0

if /i "%1" == "release" goto RELEASE
goto :usage

:RELEASE
    if "%2"== "" goto :usage
    set version=%2

    for %%d in ("%~dp0.") do set package=%%~nxd

    echo Createing assets for "%package%"...

    :: create downloadable assets
    set branch=master
    set archive=%package%.sublime-package
    set assets="%archive%#%archive%"
    call git push origin %branch%
    call git archive --format zip -o "%archive%" %branch%

    :: create the release
    gh release create --target %branch% -t "v%version%" "st3/%version%" %assets%
    del /f /q *.sublime-package
    git fetch
    goto :eof

:USAGE
    echo USAGE:
    echo.
    echo   make ^[release^]
    echo.
    echo   release ^<semver^> -- create and publish a release (e.g. 1.2.3)
    goto :eof

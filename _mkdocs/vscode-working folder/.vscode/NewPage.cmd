rem GATHER DETAILS

set pageType=0
set pageTypeName=''
set pageCategory=0
set pageCategoryName=''
set pageName=''
set templateFile=''
set destinationFile=''

@echo off
echo What kind of file?
echo 1:Blog Post, 2:Article, 3:Slideshow, 4:Cardset
set /p pageType="Enter a number: "
call :type_%pageType%
echo templateFile = %templateFile%

if "%pageType%" NEQ "1" (
    echo Which Category?
    echo 1:Learning, 2:Coaching, 3:Tools, 4:Analytics
    set /p pageCategory="Enter a number: "
)
:UniquePageName
set /p pageName="Enter a new file name: "
set pageName=%pageName: =_%

call :category_%pageCategory%

if EXIST %destinationFile% (
    echo This file already exists. Please, enter a new file name.
    echo Or hold [CTRL]+[C] to cancel creating a new file.
    GOTO UniquePageName
)

SETLOCAL ENABLEDELAYEDEXPANSION
call :ToLowerCase pageName

xcopy %templateFile% %destinationFile%

echo Your new %pageTypeName% called %pageName% was created in the %pageCategoryName% Docs subfolder

ENDLOCAL
GOTO:EOF

rem PREP FOR FILE CREATION COMMAND
:type_1
    set pageTypeName=Blog Post
    set templateFile="%cd%\_resources\_templates\template.blogpost.html"
    EXIT /B
:type_2
    set pageTypeName=Article
    echo Should be a template file
    set templateFile="%cd%\_resources\_templates\template.article.html"
    EXIT /B
:type_3
    set pageTypeName=Slideshow
    set templateFile="%cd%\_resources\_templates\template.slideshow.html"
    EXIT /B
:type_4
    set pageTypeName=Cardset
    set templateFile="%cd%\_resources\_templates\template.cardset.html"
    EXIT /B

:category_0
    set pageCategoryName=Blog
    set destinationFile="%cd%\docs\blog\%pageName%.md"
    EXIT /B
:category_1
    set pageCategoryName=Learning
    set destinationFile="%cd%\docs\learning\%pageName%.md"
    EXIT /B
:category_2
    set pageCategoryName=Coaching
    set destinationFile="%cd%\docs\coaching\%pageName%.md"
    EXIT /B
:category_3
    set pageCategoryName=Tools
    set destinationFile="%cd%\docs\tools\%pageName%.md"
    EXIT /B
:category_4
    set pageCategoryName=Analytics
    set destinationFile="%cd%\docs\analytics\%pageName%.md"
    EXIT /B

rem CONVERT STRING TO LOWER CASE
:ToLowerCase
    SET %~1=!%~1:A=a!
    SET %~1=!%~1:B=b!
    SET %~1=!%~1:C=c!
    SET %~1=!%~1:D=d!
    SET %~1=!%~1:E=e!
    SET %~1=!%~1:F=f!
    SET %~1=!%~1:G=g!
    SET %~1=!%~1:H=h!
    SET %~1=!%~1:I=i!
    SET %~1=!%~1:J=j!
    SET %~1=!%~1:K=k!
    SET %~1=!%~1:L=l!
    SET %~1=!%~1:M=m!
    SET %~1=!%~1:N=n!
    SET %~1=!%~1:O=o!
    SET %~1=!%~1:P=p!
    SET %~1=!%~1:Q=q!
    SET %~1=!%~1:R=r!
    SET %~1=!%~1:S=s!
    SET %~1=!%~1:T=t!
    SET %~1=!%~1:U=u!
    SET %~1=!%~1:V=v!
    SET %~1=!%~1:W=w!
    SET %~1=!%~1:X=x!
    SET %~1=!%~1:Y=y!
    SET %~1=!%~1:Z=z!
    EXIT /B
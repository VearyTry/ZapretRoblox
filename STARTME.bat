@echo off
setlocal EnableExtensions EnableDelayedExpansion
cd /d "%~dp0"

:: Request admin rights if needed.
net session >nul 2>&1
if not "%errorlevel%"=="0" (
    echo [INFO] Requesting administrator rights...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -ArgumentList 'elevated' -Verb RunAs"
    exit /b
)

:menu
cls
call :print_logo
echo.
echo     ================ Select an action ================
echo     1) Start Zapret
echo     2) Stop Zapret
echo     0) Exit
echo     ==================================================
echo.
set /p choice="    Choice: "

if "%choice%"=="1" goto action_start
if "%choice%"=="2" goto action_stop
if "%choice%"=="0" exit /b
goto menu

:action_start
echo [INFO] Running setup tasks...
if not exist "%~dp0lists\" mkdir "%~dp0lists\"
if not exist "%~dp0utils\" mkdir "%~dp0utils\"

set "STEP=1"
(
echo cloudflare-ech.com
echo encryptedsni.com
echo cloudflareaccess.com
echo cloudflareapps.com
echo cloudflarebolt.com
echo cloudflareclient.com
echo cloudflareinsights.com
echo cloudflareok.com
echo cloudflarepartners.com
echo cloudflareportal.com
echo cloudflarepreview.com
echo cloudflareresolve.com
echo cloudflaressl.com
echo cloudflarestatus.com
echo cloudflarestorage.com
echo cloudflarestream.com
echo cloudflaretest.com
echo dis.gd
echo discord-attachments-uploads-prd.storage.googleapis.com
echo discord.app
echo discord.co
echo discord.com
echo discord.design
echo discord.dev
echo discord.gift
echo discord.gifts
echo discord.gg
echo discord.media
echo discord.new
echo discord.store
echo discord.status
echo discord-activities.com
echo discordactivities.com
echo discordapp.com
echo discordapp.net
echo discordcdn.com
echo discordmerch.com
echo discordpartygames.com
echo discordsays.com
echo discordsez.com
echo discordstatus.com
echo frankerfacez.com
echo ffzap.com
echo betterttv.net
echo 7tv.app
echo 7tv.io
echo localizeapi.com
echo roblox.com
echo www.roblox.com
echo auth.roblox.com
echo accountsettings.roblox.com
echo assetgame.roblox.com
echo assetdelivery.roblox.com
echo catalog.roblox.com
echo avatar.roblox.com
echo itemconfiguration.roblox.com
echo economy.roblox.com
echo apis.roblox.com
echo clientsettings.api.roblox.com
echo chat.roblox.com
echo voice.roblox.com
echo friends.roblox.com
echo groups.roblox.com
echo notifications.roblox.com
echo presence.roblox.com
echo realtime.roblox.com
echo chatmoderation.roblox.com
echo studio.roblox.com
echo publish.roblox.com
echo develop.roblox.com
echo devforum.roblox.com
echo setup.rbxcdn.com
echo rbxcdn.com
echo versioncompatibility.roblox.com
echo sitetest.roblox.com
echo trades.roblox.com
echo translations.roblox.com
echo tutorials.roblox.com
echo ecs.roblox.com
echo gameanalytics.roblox.com
echo metrics.roblox.com
echo telemetry.roblox.com
echo abtesting.roblox.com
echo adconfiguration.roblox.com
echo ads.roblox.com
echo adserver.roblox.com
echo adspolicy.roblox.com
echo api.roblox.com
echo billing.roblox.com
echo captcha.roblox.com
echo cdn.roblox.com
echo chatrealtime.roblox.com
echo client-telemetry.roblox.com
echo clientsettingscdn.roblox.com
echo clicks.roblox.com
echo contentstore.roblox.com
echo ephemeralcounters.api.roblox.com
echo followings.roblox.com
echo gamepersistence.roblox.com
echo games.roblox.com
echo graphql.roblox.com
echo groupsmoderation.roblox.com
echo inventory.roblox.com
echo locale.roblox.com
echo localizationtables.roblox.com
echo matchmaking.roblox.com
echo pointbalancing.roblox.com
echo premiumfeatures.roblox.com
echo privatemessages.roblox.com
echo ratings.roblox.com
echo search.roblox.com
echo thumbnails.roblox.com
echo tix.roblox.com
echo translationservice.roblox.com
echo users.roblox.com
echo usersmoderation.roblox.com
echo web.roblox.com
echo wiki.roblox.com
echo wire.roblox.com
echo clientconfig.roblox.com
echo config.roblox.com
echo crl.roblox.com
echo status.roblox.com
echo setup.roblox.com
echo update.roblox.com
echo s3.amazonaws.com
echo stun.l.google.com
echo stun1.l.google.com
echo stun2.l.google.com
echo stun3.l.google.com
echo stun4.l.google.com
echo stun.services.mozilla.com
echo global.stun.twilio.com
echo turn.twilio.com
echo geoip.roblox.com
echo geoip.services.roblox.com
echo ocsp.digicert.com
echo ocsp.verisign.com
echo crl.verisign.com
echo setup-cdn.roblox.com
echo roblox-setup.roblox.com
echo roblox-update.roblox.com
echo update-cdn.roblox.com
echo api.rbxcdn.com
echo setup.api.rbxcdn.com
echo setup.cache.rbxcdn.com
echo cs.rbxcdn.com
echo roblox-setup.cache.roblox.com
echo roblox-update.cache.roblox.com
echo setup.cache.roblox.com
echo update.cache.roblox.com
echo gamejoin.roblox.com
echo client.roblox.com
echo contentdelivery.roblox.com
echo economycdn.roblox.com
echo matchmaking.api.roblox.com
echo presence.api.roblox.com
echo friends.api.roblox.com
echo groups.api.roblox.com
echo inventory.api.roblox.com
echo catalog.api.roblox.com
echo avatar.api.roblox.com
echo users.api.roblox.com
echo develop.api.roblox.com
echo devforum.api.roblox.com
echo akamaized.net
echo cloudfront.net
echo amazonaws.com
echo rblx.com
echo robloxapp.com
echo robloxgames.com
echo robloxlabs.com
echo rbx.com
echo rbxlabs.com
echo rbxcdn.xyz
echo rbxcdn.site
echo rbxcdn.tech
echo rbxcdn.one
echo rbxcdn.today
echo rbxcdn.world
echo rbxcdn.services
echo rbxcdn.work
echo rbxcdn.space
echo rbxcdn.online
echo rbxcdn.store
echo rbxcdn.fun
echo rbxcdn.biz
echo rbxcdn.us
echo rbxcdn.org
echo rbxcdn.net
echo rbxcdn.co
echo rbxcdn.me
echo rbxcdn.tv
echo rbxcdn.cc
echo rbxcdn.gg
echo rbxcdn.dev
echo rbxcdn.io
echo edgecastcdn.net
echo footprint.net
echo llnwd.net
echo hwcdn.net
echo gcdn.co
echo g-cdn.net
echo cdngc.net
echo cdngs.net
echo secure.footprint.net
echo secure.llnwd.net
echo roblox.qq.com
echo roblox.cn
echo t.me
echo tg.dev
echo tg.org
echo tx.me
echo teleg.xyz
echo telegram.ai
echo telegram.asia
echo telegram.biz
echo telegram.cloud
echo telegram.cn
echo telegram.co
echo telegram.com
echo telegram.de
echo telegram.dev
echo telegram.dog
echo telegram.eu
echo telegram.fr
echo telegram.host
echo telegram.in
echo telegram.info
echo telegram.io
echo telegram.jp
echo telegram.me
echo telegram.net
echo telegram.org
echo api.telegram.org
echo telegram.qa
echo telegram.ru
echo telegram.services
echo telegram.solutions
echo telegram.space
echo telegram.team
echo telegram.tech
echo telegram.uk
echo telegram.us
echo telegram.website
echo telegram.xyz
echo telegramapp.org
echo telegra.ph
echo telesco.pe
echo nicegram.app
echo telegramdownload.com
echo cdn-telegram.org
echo comments.app
echo contest.com
echo fragment.com
echo graph.org
echo quiz.directory
echo tdesktop.com
echo telega.one
echo telegram-cdn.org
echo usercontent.dev
echo tgram.org
echo torg.org
) > "%~dp0lists\list-general.txt"

echo [i] Enabling TCP timestamps...
netsh interface tcp set global timestamps=enabled > nul 2>&1

echo [i] Creating flag files...
echo ENABLED > "%~dp0utils\game_filter.enabled"
type nul > "%~dp0lists\ipset-all.txt"

echo [i] Installing Zapret service...
call :install_service "general (ALT10).bat"

echo.
echo [OK] Zapret started and service installed successfully.
pause
goto menu

:action_stop
echo.
echo [i] Stopping and removing Zapret service...
set "SRVCNAME=zapret"
sc query "%SRVCNAME%" >nul 2>&1
if !errorlevel!==0 (
    net stop %SRVCNAME% >nul 2>&1
    sc delete %SRVCNAME% >nul 2>&1
    echo Service "%SRVCNAME%" removed.
) else (
    echo Service "%SRVCNAME%" is not installed.
)

echo [INFO] Cleaning up processes and drivers...
taskkill /IM winws.exe /F > nul 2>&1
net stop "WinDivert" >nul 2>&1
sc delete "WinDivert" >nul 2>&1
net stop "WinDivert14" >nul 2>&1
sc delete "WinDivert14" >nul 2>&1

echo.
echo [OK] Zapret has been stopped.
pause
goto menu

:install_service
set "selectedFile=%~1"
set "BIN_PATH=%~dp0bin\"
set "LISTS_PATH=%~dp0lists\"
set "GameFilter=1024-65535"
set "args_with_value=sni host altorder"
set "args="
set "capture=0"
set "mergeargs=0"
set QUOTE="

for /f "tokens=*" %%a in ('type "!selectedFile!"') do (
    set "line=%%a"
    call set "line=%%line:^!=EXCL_MARK%%"
    echo !line! | findstr /i "winws.exe" >nul
    if not errorlevel 1 set "capture=1"
    if !capture!==1 (
        if not defined args set "line=!line:*winws.exe"=!"
        set "temp_args="
        for %%i in (!line!) do (
            set "arg=%%i"
            if not "!arg!"=="^" (
                if "!arg:~0,2!" EQU "--" if not !mergeargs!==0 set "mergeargs=0"
                if "!arg:~0,1!" EQU "!QUOTE!" (
                    set "arg=!arg:~1,-1!"
                    echo !arg! | findstr ":" >nul
                    if !errorlevel!==0 ( set "arg=\!QUOTE!!arg!\!QUOTE!" ) else if "!arg:~0,1!"=="@" ( set "arg=\!QUOTE!@%~dp0!arg:~1!\!QUOTE!" ) else if "!arg:~0,5!"=="%%BIN%%" ( set "arg=\!QUOTE!!BIN_PATH!!arg:~5!\!QUOTE!" ) else if "!arg:~0,7!"=="%%LISTS%%" ( set "arg=\!QUOTE!!LISTS_PATH!!arg:~7!\!QUOTE!" ) else ( set "arg=\!QUOTE!%~dp0!arg!\!QUOTE!" )
                ) else if "!arg:~0,12!" EQU "%%GameFilter%%" ( set "arg=%GameFilter%" )
                if !mergeargs!==1 ( set "temp_args=!temp_args!,!arg!" ) else if !mergeargs!==3 ( set "temp_args=!temp_args!=!arg!" & set "mergeargs=1" ) else ( set "temp_args=!temp_args! !arg!" )
                if "!arg:~0,2!" EQU "--" ( set "mergeargs=2" ) else if !mergeargs! GEQ 1 (
                    if !mergeargs!==2 set "mergeargs=1"
                    for %%x in (!args_with_value!) do ( if /i "%%x"=="!arg!" set "mergeargs=3" )
                )
            )
        )
        if not "!temp_args!"=="" set "args=!args! !temp_args!"
    )
)
set ARGS=%args%
call set "ARGS=%%ARGS:EXCL_MARK=^!%%"
set SRVCNAME=zapret
net stop %SRVCNAME% >nul 2>&1
sc delete %SRVCNAME% >nul 2>&1
sc create %SRVCNAME% binPath= "\"%BIN_PATH%winws.exe\" !ARGS!" DisplayName= "zapret" start= auto >nul
sc description %SRVCNAME% "Zapret DPI bypass software" >nul
sc start %SRVCNAME% >nul
exit /b

:print_logo
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
echo(
echo        %ESC%[38;5;129mMMM"""AMV       db      `7MM"""Mq.`7MM"""Mq.  `7MM"""YMM MMP""MM""YMM 
echo        %ESC%[38;5;128mM'   AMV       ;MM:       MM   `MM. MM   `MM.   MM    `7 P'   MM   `7 
echo        %ESC%[38;5;92m'   AMV       ,V^MM.      MM   ,M9  MM   ,M9    MM   d        MM      
echo        %ESC%[38;5;56m   AMV       ,M  `MM      MMmmdM9   MMmmdM9     MMmmMM        MM      
echo        %ESC%[38;5;32m  AMV   ,    AbmmmqMA     MM        MM  YM.     MM   Y  ,     MM      
echo        %ESC%[38;5;38m AMV   ,M   A'     VML    MM        MM   `Mb.   MM     ,M     MM      
echo        %ESC%[38;5;45mAMVmmmmMM .AMA.   .AMMA..JMML.    .JMML. .JMM..JMMmmmmMMM   .JMML.    %ESC%[0m
exit /b

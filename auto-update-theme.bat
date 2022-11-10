@echo off
  setlocal enableextensions disabledelayedexpansion

  set "now=%time: =0%"

  set "task=day"

  ::based on the time we will update this task variable
  if "%now%" lss "06:30:00,00" ( set "task=night" )
  if "%now%" geq "18:30:00,00" ( set "task=night" )

  call :task_%task%

  endlocal
  exit /b


:task_day
  ::execute the command to change to light theme
  reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 1 /f
  goto :eof


:task_night
  ::execute the command to change to dark theme
  reg add HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 0 /f
  goto :eof

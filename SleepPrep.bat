@echo off

for /f "tokens=2*" %%a in ('reg query "HKEY_CURRENT_USER\SOFTWARE\@MyKeys " /v SleepPlanGUID') do set "SleepPlanGUID=%%b"

for /f "tokens=4" %%i in ('powercfg /getactivescheme') do set "ActivePlanGUID=%%i"
echo %ActivePlanGUID%
echo %SleepPlanGUID%

reg add HKEY_CURRENT_USER\SOFTWARE\@MyKeys /v ActivePlanGUID /t REG_SZ /d %ActivePlanGUID% /f
powercfg /setactive %SleepPlanGUID%

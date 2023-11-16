@echo off

for /f "tokens=2*" %%a in ('reg query "HKEY_CURRENT_USER\SOFTWARE\@MyKeys " /v ActivePlanGUID') do set "ActivePlanGUID=%%b"

rem reg add HKEY_CURRENT_USER\SOFTWARE\@MyKeys /v ActivePlanGUID /t REG_SZ /d %ActivePlanGUID% /f
powercfg /setactive %ActivePlanGUID%

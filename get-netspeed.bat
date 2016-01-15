REM get lan speed , if LAN SPEED =1000M is ok , or fail.
REM wmic NIC where NetEnabled=true get Name, Speed

wmic NIC where NetEnabled=true get Name, Speed | FIND "Realtek PCIe GBE Family Controller  1000000000"
if errorlevel 1 goto fail
if errorlevel 0 goto ok

:fail
echo 1G...fail>..\result.txt
:fail2
fail 1GLAN FAIL
goto fail2

:ok
echo 1G...PASS>..\result.txt
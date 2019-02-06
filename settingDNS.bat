set dns1=input primary DNS
set dns2=input secondary DNS

netsh interface ipv4 set dnsservers "Local Area Connection" static %dns1% primary
netsh interface ip set dnsservers "Local Area Connection" static %dns1%
netsh interface ip add dnsservers "Local Area Connection" %dns2% index=2

set /a count=2
:Loop
if %count%== 10 goto end

netsh interface ipv4 set dnsservers "Local Area Connection %count%" static %dns1% primary
netsh interface ip set dnsservers "Local Area Connection %count%" static %dns1%
netsh interface ip add dnsservers "Local Area Connection %count%" %dns2% index=2

set /a count=%count% + 1
goto Loop
:end


netsh interface ipv4 set dnsservers "Ethernet" static %dns1% primary
netsh interface ip set dnsservers "Ethernet" static %dns1%
netsh interface ip add dnsservers "Ethernet" %dns2% index=2

set /a count2=2
:Loop2
if %count2%== 5 goto end2

netsh interface ipv4 set dnsservers "Ethernet %count2%" static %dns1% primary
netsh interface ip set dnsservers "Ethernet %count2%" static %dns1%
netsh interface ip add dnsservers "Ethernet %count2%" %dns2% index=2

set /a count2=%count2% + 1
goto Loop2
:end2

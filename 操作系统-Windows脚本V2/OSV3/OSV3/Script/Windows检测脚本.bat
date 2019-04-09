@echo off
for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (
 if not "%%a" == "默认" set IPaddress=%%a
)
cd C:\
md %IPaddress%
cd %IPaddress%
echo 1.系统信息(CreatebyG001) > %IPaddress%
	systeminfo >>　%IPaddress%
echo 2.网卡信息(CreatebyG002) >> %IPaddress%
	ipconfig >>　%IPaddress%
echo 3.监听端口(CreatebyG003) >> %IPaddress%
	netstat -an | find "LISTENING" >> %IPaddress%
echo 4.系统服务(CreatebyG004) >> %IPaddress%
	net start >> %IPaddress%
echo 5.系统进程(CreatebyG005) >> %IPaddress%
	tasklist >> %IPaddress%
echo 6.软件列表(CreatebyG006) >> %IPaddress%
    for /f "tokens=3 delims=\" %%i in ('reg query HKLM\SOFTWARE') do (
    >> %IPaddress%                echo  ******************
    >> %IPaddress%                echo  软件名称:%%i
    >> %IPaddress%                echo  ******************
    if not "%%i"=="Classes" for /f "tokens=4 delims=\" %%j in ('reg query HKLM\SOFTWARE\%%i 2^>nul') do (echo 软件信息: %%j>> %IPaddress%)
    )   
echo 7.本地策略(CreatebyG007) >> %IPaddress%
    secedit /export /cfg C:\temp.txt
    echo ---密码策略--- >> %IPaddress%
    echo "0表示禁用，1表示启用" >> %IPaddress%
    echo *密码必须符合复杂性要求* >> %IPaddress%
    find "PasswordComplexity" C:\temp.txt |find "PasswordComplexity = ">> %IPaddress%
    echo *密码长度最小值* >> %IPaddress%
    find "MinimumPasswordLength" C:\temp.txt|find "MinimumPasswordLength = " >> %IPaddress%
    echo *密码最短使用期限* >> %IPaddress%
    find "MinimumPasswordAge" C:\temp.txt|find "MinimumPasswordAge = " >> %IPaddress%
    echo *密码最长使用期限* >> %IPaddress%
    find "MaximumPasswordAge" C:\temp.txt|find "MaximumPasswordAge = " >> %IPaddress%
    echo *强制密码历史* >> %IPaddress%
    find "PasswordHistorySize" C:\temp.txt|find "PasswordHistorySize = " >> %IPaddress%
    echo *用可还原的加密来存储密码* >> %IPaddress%
    find "ClearTextPassword" C:\temp.txt|find "ClearTextPassword = " >> %IPaddress%
    echo ---账户锁定策略（无结果表示未开启）--- >> %IPaddress%
    echo *账户锁定时间* >> %IPaddress%
    find "LockoutDuration" C:\temp.txt |find "LockoutDuration" >> %IPaddress%
    echo *复位账户锁定计时器* >> %IPaddress%
    find "ResetLockoutCount" C:\temp.txt |find "ResetLockoutCount">> %IPaddress%
    echo *账户锁定阈值* >> %IPaddress%
    find "LockoutBadCount" C:\temp.txt |find "LockoutBadCount" >> %IPaddress%
    echo ---审核策略--- >> %IPaddress%
    echo ---0表示无审核，1表示成功审核，2表示失败审核，3表示成功和失败审核--- >> %IPaddress%
    echo *审核帐户管理* >> %IPaddress%
    find "AuditAccountManage" C:\temp.txt | find "AuditAccountManage" >> %IPaddress%
    echo *审核帐户登录事件* >> %IPaddress%
    find "AuditAccountLogon" C:\temp.txt | find "AuditAccountLogon" >> %IPaddress%
    echo *审核系统事件* >> %IPaddress%
    find "AuditSystemEvents" C:\temp.txt | find "AuditSystemEvents" >> %IPaddress%
    echo *审核目录服务访问* >> %IPaddress%
    find "AuditDSAccess" C:\temp.txt | find "AuditDSAccess" >> %IPaddress%
    echo *审核过程跟踪* >> %IPaddress%
    find "AuditProcessTracking" C:\temp.txt | find "AuditProcessTracking" >> %IPaddress%
    echo *审核特权使用* >> %IPaddress%
    find "AuditPrivilegeUse" C:\temp.txt | find "AuditPrivilegeUse" >> %IPaddress%
    echo *审核对象访问* >> %IPaddress%
    find "AuditObjectAccess" C:\temp.txt | find "AuditObjectAccess" >> %IPaddress%
    echo *审核登录事件* >> %IPaddress%
    find "AuditLogonEvents" C:\temp.txt | find "AuditLogonEvents" >> %IPaddress%
    echo *审核策略更改* >> %IPaddress%
    find "AuditPolicyChange" C:\temp.txt | find "AuditPolicyChange" >> %IPaddress%
    echo ---安全选项--- >> %IPaddress%
    echo *0表示已停用，1表示已启用* >> %IPaddress%
    echo *在挂起会话之前所需的空闲时间* >> %IPaddress%
    find "AutoDisconnect" C:\temp.txt | find "AutoDisconnect" >> %IPaddress%
    echo *不显示上次登录的用户名* >> %IPaddress%
    find "DontDisplayLastUserName" C:\temp.txt | find "DontDisplayLastUserName" >> %IPaddress%
    echo *关机前清理虚拟内存页面* >> %IPaddress%
    find "ClearPageFileAtShutdown" C:\temp.txt | find "ClearPageFileAtShutdown" >> %IPaddress%
    echo *允许在未登录前关机* >> %IPaddress%
    find "ShutdownWithoutLogon" C:\temp.txt | find "ShutdownWithoutLogon" >> %IPaddress%
    echo ---用户权利分配---  >> %IPaddress%
    echo (Everyone:*S-1-1-0  Administrators:*S-1-5-32-544  Users:*S-1-5-32-545  Power Users:*S-1-5-32-547  Backup Operators:*S-1-5-32-551) >> %IPaddress%
    echo *从远程系统强制关机* >> %IPaddress%
    find "SeRemoteShutdownPrivilege" C:\temp.txt | find "SeRemoteShutdownPrivilege" >> %IPaddress%
    echo *取得文件或其他对象所有权* >> %IPaddress%
    find "SeTakeOwnershipPrivilege" C:\temp.txt | find "SeTakeOwnershipPrivilege" >> %IPaddress%
	echo *从本地登录此计算机* >> %IPaddress%
    find "SeInteractiveLogonRight" C:\temp.txt | find "SeInteractiveLogonRight" >> %IPaddress%
    echo *允许通过远程桌面服务登录* >> %IPaddress%
    find "SeRemoteInteractiveLogonRight" C:\temp.txt | find "SeRemoteInteractiveLogonRight" >> %IPaddress%
	echo *调试程序* >> %IPaddress%
    find "SeDebugPrivilege" C:\temp.txt | find "SeDebugPrivilege" >> %IPaddress%
	echo *更改系统时间* >> %IPaddress%
    find "SeSystemtimePrivilege" C:\temp.txt | find "SeSystemtimePrivilege" >> %IPaddress%
	echo *管理审核和安全日志* >> %IPaddress%
    find "SeSecurityPrivilege" C:\temp.txt | find "SeSecurityPrivilege" >> %IPaddress%
    del C:\temp.txt
echo 8.系统用户(CreatebyG008) >> %IPaddress%
    net user >> %IPaddress%
    for /f "skip=4 delims=" %%a in ('net user^|findstr /vx "命令成功完成。"') do for %%i in (%%a) do net user %%i >> %IPaddress%
    net localgroup >> %IPaddress%
    net localgroup Administrators >> %IPaddress%	
	net localgroup Guests >> %IPaddress%	
echo 9.其它选项(CreatebyG009) >> %IPaddress%	
	echo *自动播放* （oxff为关闭全部自动播放，无结果则开启） >> %IPaddress%
    reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDriveTypeAutoRun |find "NoDriveTypeAutoRun" >> %IPaddress%
	echo ---屏幕保护程序--- >> %IPaddress%
    echo *是否开启屏保* （0关，1开）>> %IPaddress%
    reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveActive |find "ScreenSaveActive" >> %IPaddress%
    echo *屏保时间*（单位秒）>> %IPaddress%
    reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveTimeOut |find "ScreenSaveTimeOut" >> %IPaddress%
    echo *屏保恢复时使用密码保护* （0否，1是）>> %IPaddress%
    reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure |find "ScreenSaverIsSecure" >> %IPaddress%
	echo *防火墙状态*（1开，0关）>> %IPaddress%
    reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\StandardProfile /v EnableFirewall |find "EnableFirewall" >> %IPaddress%
	echo *远程桌面* (0开，1关) >> %IPaddress%
    reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections |find "fDenyTSConnections" >> %IPaddress%
    echo *3389端口* (d3d:3389) >> %IPaddress%
    reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber |find "PortNumber" >> %IPaddress%
	echo *远程协助* (0关（合规），1开) >> %IPaddress%
    reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Remote Assistance" /v fAllowToGetHelp |find "fAllowToGetHelp" >> %IPaddress%
	echo *日志文件大小*  >> %IPaddress%
	echo *应用日志文件大小*（0x2800000以上为合规）  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\Application" /v MaxSize |find "MaxSize" >> %IPaddress%
	echo *达到事件日志最大大小时*（不存在或0均合规）  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\Application" /v Retention |find "Retention" >> %IPaddress%
	echo *安全日志文件大小*（0x2800000以上为合规）  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\Security" /v MaxSize |find "MaxSize" >> %IPaddress%
	echo *达到事件日志最大大小时*（不存在或0均合规）  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\Security" /v Retention |find "Retention" >> %IPaddress%
	echo *系统日志文件大小*（0x2800000以上为合规）  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\System" /v MaxSize |find "MaxSize" >> %IPaddress%
	echo *达到事件日志最大大小时*（不存在或0均合规）  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\System" /v Retention |find "Retention" >> %IPaddress%
	echo *默认共享*（注册表 + net share查看）  >> %IPaddress%
	echo *分区共享*（存在且为0，为合规）  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v AutoShareServer |find "AutoShareServer" >> %IPaddress%
	echo *ADMIN共享*（存在且为0，为合规） >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v AutoShareWks |find "AutoShareWks" >> %IPaddress%
	echo *IPC共享* （存在且为1，为合规） >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v restrictanonymous |find "restrictanonymous" >> %IPaddress%
	echo *共享列表*  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\lanmanserver\shares" >> %IPaddress%
	echo *默认共享*  >> %IPaddress%
	net share >> %IPaddress%
	copy C:\Windows\WindowsUpdate.log .\
	ren WindowsUpdate.log %IPaddress%.updatelog
	reg save hklm\sam %IPaddress%.sam
	reg save hklm\system %IPaddress%.system
pause
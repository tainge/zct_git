@echo off
for /f "tokens=4" %%a in ('route print^|findstr 0.0.0.0.*0.0.0.0') do (
 if not "%%a" == "Ĭ��" set IPaddress=%%a
)
cd C:\
md %IPaddress%
cd %IPaddress%
echo 1.ϵͳ��Ϣ(CreatebyG001) > %IPaddress%
	systeminfo >>��%IPaddress%
echo 2.������Ϣ(CreatebyG002) >> %IPaddress%
	ipconfig >>��%IPaddress%
echo 3.�����˿�(CreatebyG003) >> %IPaddress%
	netstat -an | find "LISTENING" >> %IPaddress%
echo 4.ϵͳ����(CreatebyG004) >> %IPaddress%
	net start >> %IPaddress%
echo 5.ϵͳ����(CreatebyG005) >> %IPaddress%
	tasklist >> %IPaddress%
echo 6.����б�(CreatebyG006) >> %IPaddress%
    for /f "tokens=3 delims=\" %%i in ('reg query HKLM\SOFTWARE') do (
    >> %IPaddress%                echo  ******************
    >> %IPaddress%                echo  �������:%%i
    >> %IPaddress%                echo  ******************
    if not "%%i"=="Classes" for /f "tokens=4 delims=\" %%j in ('reg query HKLM\SOFTWARE\%%i 2^>nul') do (echo �����Ϣ: %%j>> %IPaddress%)
    )   
echo 7.���ز���(CreatebyG007) >> %IPaddress%
    secedit /export /cfg C:\temp.txt
    echo ---�������--- >> %IPaddress%
    echo "0��ʾ���ã�1��ʾ����" >> %IPaddress%
    echo *���������ϸ�����Ҫ��* >> %IPaddress%
    find "PasswordComplexity" C:\temp.txt |find "PasswordComplexity = ">> %IPaddress%
    echo *���볤����Сֵ* >> %IPaddress%
    find "MinimumPasswordLength" C:\temp.txt|find "MinimumPasswordLength = " >> %IPaddress%
    echo *�������ʹ������* >> %IPaddress%
    find "MinimumPasswordAge" C:\temp.txt|find "MinimumPasswordAge = " >> %IPaddress%
    echo *�����ʹ������* >> %IPaddress%
    find "MaximumPasswordAge" C:\temp.txt|find "MaximumPasswordAge = " >> %IPaddress%
    echo *ǿ��������ʷ* >> %IPaddress%
    find "PasswordHistorySize" C:\temp.txt|find "PasswordHistorySize = " >> %IPaddress%
    echo *�ÿɻ�ԭ�ļ������洢����* >> %IPaddress%
    find "ClearTextPassword" C:\temp.txt|find "ClearTextPassword = " >> %IPaddress%
    echo ---�˻��������ԣ��޽����ʾδ������--- >> %IPaddress%
    echo *�˻�����ʱ��* >> %IPaddress%
    find "LockoutDuration" C:\temp.txt |find "LockoutDuration" >> %IPaddress%
    echo *��λ�˻�������ʱ��* >> %IPaddress%
    find "ResetLockoutCount" C:\temp.txt |find "ResetLockoutCount">> %IPaddress%
    echo *�˻�������ֵ* >> %IPaddress%
    find "LockoutBadCount" C:\temp.txt |find "LockoutBadCount" >> %IPaddress%
    echo ---��˲���--- >> %IPaddress%
    echo ---0��ʾ����ˣ�1��ʾ�ɹ���ˣ�2��ʾʧ����ˣ�3��ʾ�ɹ���ʧ�����--- >> %IPaddress%
    echo *����ʻ�����* >> %IPaddress%
    find "AuditAccountManage" C:\temp.txt | find "AuditAccountManage" >> %IPaddress%
    echo *����ʻ���¼�¼�* >> %IPaddress%
    find "AuditAccountLogon" C:\temp.txt | find "AuditAccountLogon" >> %IPaddress%
    echo *���ϵͳ�¼�* >> %IPaddress%
    find "AuditSystemEvents" C:\temp.txt | find "AuditSystemEvents" >> %IPaddress%
    echo *���Ŀ¼�������* >> %IPaddress%
    find "AuditDSAccess" C:\temp.txt | find "AuditDSAccess" >> %IPaddress%
    echo *��˹��̸���* >> %IPaddress%
    find "AuditProcessTracking" C:\temp.txt | find "AuditProcessTracking" >> %IPaddress%
    echo *�����Ȩʹ��* >> %IPaddress%
    find "AuditPrivilegeUse" C:\temp.txt | find "AuditPrivilegeUse" >> %IPaddress%
    echo *��˶������* >> %IPaddress%
    find "AuditObjectAccess" C:\temp.txt | find "AuditObjectAccess" >> %IPaddress%
    echo *��˵�¼�¼�* >> %IPaddress%
    find "AuditLogonEvents" C:\temp.txt | find "AuditLogonEvents" >> %IPaddress%
    echo *��˲��Ը���* >> %IPaddress%
    find "AuditPolicyChange" C:\temp.txt | find "AuditPolicyChange" >> %IPaddress%
    echo ---��ȫѡ��--- >> %IPaddress%
    echo *0��ʾ��ͣ�ã�1��ʾ������* >> %IPaddress%
    echo *�ڹ���Ự֮ǰ����Ŀ���ʱ��* >> %IPaddress%
    find "AutoDisconnect" C:\temp.txt | find "AutoDisconnect" >> %IPaddress%
    echo *����ʾ�ϴε�¼���û���* >> %IPaddress%
    find "DontDisplayLastUserName" C:\temp.txt | find "DontDisplayLastUserName" >> %IPaddress%
    echo *�ػ�ǰ���������ڴ�ҳ��* >> %IPaddress%
    find "ClearPageFileAtShutdown" C:\temp.txt | find "ClearPageFileAtShutdown" >> %IPaddress%
    echo *������δ��¼ǰ�ػ�* >> %IPaddress%
    find "ShutdownWithoutLogon" C:\temp.txt | find "ShutdownWithoutLogon" >> %IPaddress%
    echo ---�û�Ȩ������---  >> %IPaddress%
    echo (Everyone:*S-1-1-0  Administrators:*S-1-5-32-544  Users:*S-1-5-32-545  Power Users:*S-1-5-32-547  Backup Operators:*S-1-5-32-551) >> %IPaddress%
    echo *��Զ��ϵͳǿ�ƹػ�* >> %IPaddress%
    find "SeRemoteShutdownPrivilege" C:\temp.txt | find "SeRemoteShutdownPrivilege" >> %IPaddress%
    echo *ȡ���ļ���������������Ȩ* >> %IPaddress%
    find "SeTakeOwnershipPrivilege" C:\temp.txt | find "SeTakeOwnershipPrivilege" >> %IPaddress%
	echo *�ӱ��ص�¼�˼����* >> %IPaddress%
    find "SeInteractiveLogonRight" C:\temp.txt | find "SeInteractiveLogonRight" >> %IPaddress%
    echo *����ͨ��Զ����������¼* >> %IPaddress%
    find "SeRemoteInteractiveLogonRight" C:\temp.txt | find "SeRemoteInteractiveLogonRight" >> %IPaddress%
	echo *���Գ���* >> %IPaddress%
    find "SeDebugPrivilege" C:\temp.txt | find "SeDebugPrivilege" >> %IPaddress%
	echo *����ϵͳʱ��* >> %IPaddress%
    find "SeSystemtimePrivilege" C:\temp.txt | find "SeSystemtimePrivilege" >> %IPaddress%
	echo *������˺Ͱ�ȫ��־* >> %IPaddress%
    find "SeSecurityPrivilege" C:\temp.txt | find "SeSecurityPrivilege" >> %IPaddress%
    del C:\temp.txt
echo 8.ϵͳ�û�(CreatebyG008) >> %IPaddress%
    net user >> %IPaddress%
    for /f "skip=4 delims=" %%a in ('net user^|findstr /vx "����ɹ���ɡ�"') do for %%i in (%%a) do net user %%i >> %IPaddress%
    net localgroup >> %IPaddress%
    net localgroup Administrators >> %IPaddress%	
	net localgroup Guests >> %IPaddress%	
echo 9.����ѡ��(CreatebyG009) >> %IPaddress%	
	echo *�Զ�����* ��oxffΪ�ر�ȫ���Զ����ţ��޽�������� >> %IPaddress%
    reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoDriveTypeAutoRun |find "NoDriveTypeAutoRun" >> %IPaddress%
	echo ---��Ļ��������--- >> %IPaddress%
    echo *�Ƿ�������* ��0�أ�1����>> %IPaddress%
    reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveActive |find "ScreenSaveActive" >> %IPaddress%
    echo *����ʱ��*����λ�룩>> %IPaddress%
    reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaveTimeOut |find "ScreenSaveTimeOut" >> %IPaddress%
    echo *�����ָ�ʱʹ�����뱣��* ��0��1�ǣ�>> %IPaddress%
    reg query "HKEY_CURRENT_USER\Control Panel\Desktop" /v ScreenSaverIsSecure |find "ScreenSaverIsSecure" >> %IPaddress%
	echo *����ǽ״̬*��1����0�أ�>> %IPaddress%
    reg query HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SharedAccess\Parameters\FirewallPolicy\StandardProfile /v EnableFirewall |find "EnableFirewall" >> %IPaddress%
	echo *Զ������* (0����1��) >> %IPaddress%
    reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections |find "fDenyTSConnections" >> %IPaddress%
    echo *3389�˿�* (d3d:3389) >> %IPaddress%
    reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" /v PortNumber |find "PortNumber" >> %IPaddress%
	echo *Զ��Э��* (0�أ��Ϲ棩��1��) >> %IPaddress%
    reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Remote Assistance" /v fAllowToGetHelp |find "fAllowToGetHelp" >> %IPaddress%
	echo *��־�ļ���С*  >> %IPaddress%
	echo *Ӧ����־�ļ���С*��0x2800000����Ϊ�Ϲ棩  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\Application" /v MaxSize |find "MaxSize" >> %IPaddress%
	echo *�ﵽ�¼���־����Сʱ*�������ڻ�0���Ϲ棩  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\Application" /v Retention |find "Retention" >> %IPaddress%
	echo *��ȫ��־�ļ���С*��0x2800000����Ϊ�Ϲ棩  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\Security" /v MaxSize |find "MaxSize" >> %IPaddress%
	echo *�ﵽ�¼���־����Сʱ*�������ڻ�0���Ϲ棩  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\Security" /v Retention |find "Retention" >> %IPaddress%
	echo *ϵͳ��־�ļ���С*��0x2800000����Ϊ�Ϲ棩  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\System" /v MaxSize |find "MaxSize" >> %IPaddress%
	echo *�ﵽ�¼���־����Сʱ*�������ڻ�0���Ϲ棩  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Eventlog\System" /v Retention |find "Retention" >> %IPaddress%
	echo *Ĭ�Ϲ���*��ע��� + net share�鿴��  >> %IPaddress%
	echo *��������*��������Ϊ0��Ϊ�Ϲ棩  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v AutoShareServer |find "AutoShareServer" >> %IPaddress%
	echo *ADMIN����*��������Ϊ0��Ϊ�Ϲ棩 >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters" /v AutoShareWks |find "AutoShareWks" >> %IPaddress%
	echo *IPC����* ��������Ϊ1��Ϊ�Ϲ棩 >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa" /v restrictanonymous |find "restrictanonymous" >> %IPaddress%
	echo *�����б�*  >> %IPaddress%
	reg query "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\lanmanserver\shares" >> %IPaddress%
	echo *Ĭ�Ϲ���*  >> %IPaddress%
	net share >> %IPaddress%
	copy C:\Windows\WindowsUpdate.log .\
	ren WindowsUpdate.log %IPaddress%.updatelog
	reg save hklm\sam %IPaddress%.sam
	reg save hklm\system %IPaddress%.system
pause
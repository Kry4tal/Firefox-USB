@shift /0
@echo off
title FireFox Boot From USB
color F1
set root1=%~dp0
set root2=%root1%firefox\
set root3=%root1%ff\
if exist %root1%firefox.exe goto pass
if exist %root2%firefox.exe goto pass
if exist %root3%firefox.exe goto pass
title FireFox Boot From USB -- Error (FireFox Missing)
echo û���ҵ�����������޷���ʼ������ȷ�ϴ���firefox.exe��Firefox�ļ��л�ff�ļ���
pause
exit

:pass
if exist %root1%ffusb.lock goto boot
if exist %root2%ffusb.lock goto boot
if exist %root3%ffusb.lock goto boot
error no installed files...
pause


:sl1
echo �������ǵ�һ������FireFox Boot From USB������
echo �⽫����Ӱ������������У��������Ƿ���Ҫ�������ó���
echo �������FireFox�ļ������Ѿ�����profile�ļ��У��밴1
echo ���û�У��밴2���������ó���
echo �����֪�����밴3
echo �˳���ѡ��4
echo �����־��ѡ��5
echo _______________________________________________________________
echo ������ѡ����Ŀ����ţ�
set /p ID=
if "%id%"=="1" goto lockinstall
if "%id%"=="2" goto setup
if "%id%"=="3" goto try
IF "%id%"=="4" exit
IF "%id%"=="5" goto log
echo ���������
goto sl1


:setup
if exist %root1%firefox.exe start %root1%firefox.exe -p
if exist %root2%firefox.exe start %root2%firefox.exe -p
if exist %root3%firefox.exe start %root3%firefox.exe -p
echo ����Firefox�ļ����´���"profile"�ļ���(������˫����)
echo �������,���������
pause >> nul
goto lockinstall



:try
echo ɨ�豾�ػ���
title FireFox Boot From USB ɨ�豾�ػ���
echo %~dp0
echo %~f0
time /T
echo �趨����
title FireFox Boot From USB �趨����
color F2
set profile1=%root1%profile\
set profile2=%root2%profile\
set profile3=%root3%profile\
echo ������
title FireFox Boot From USB �趨����-������
color FA
set root
set profile
set profile2
echo ����Firefox
title FireFox Boot From USB ����Firefox
color F5
if exist %root1%firefox.exe start %root1%firefox.exe -Profile %profile1%
if exist %root2%firefox.exe start %root2%firefox.exe -Profile %profile2%
if exist %root3%firefox.exe start %root3%firefox.exe -Profile %profile2%
goto sl2

:sl2
echo �����������밴1��
echo δ�����������밴2��
echo ������ѡ����Ŀ����ţ�
set /p TRY=
if "%try%"=="1" goto lockinstall
if "%try%"=="2" goto pass

echo ���������
goto pass

:lockinstall
echo lock >> ffusb.lock
if exist %root1%firefox.exe move ffusb.lock %root1%/ffusb.lock
if exist %root2%firefox.exe move ffusb.lock %root2%/ffusb.lock
if exist %root3%firefox.exe move ffusb.lock %root3%/ffusb.lock
pause


:boot
echo ɨ�豾�ػ���
title FireFox Boot From USB ɨ�豾�ػ���
echo %~dp0
echo %~f0
time /T
echo �趨����
title FireFox Boot From USB �趨����
color F2
set profile1=%root1%profile\
set profile2=%root2%profile\
set profile3=%root3%profile\
echo ������
title FireFox Boot From USB �趨����-������
color FA
set root
set profile
set profile2
echo ����Firefox
title FireFox Boot From USB ����Firefox
color F5
if exist %root1%firefox.exe start %root1%firefox.exe -Profile %profile1%
if exist %root1%firefox.exe exit
if exist %root2%firefox.exe start %root2%firefox.exe -Profile %profile2%
if exist %root2%firefox.exe exit
if exist %root3%firefox.exe start %root3%firefox.exe -Profile %profile2%
if exist %root3%firefox.exe exit
color 48
title FireFox Boot From USB ERROR(FireFox Missing)--������������,����������������ϴ�log.txt
echo firefox missing...
echo ������������,����������������ϴ�log.txt

:log
echo ���� >> log.txt
echo %~dp0 >> log.txt
echo %~f0 >> log.txt
echo ϵͳʱ�� >> log.txt
time /T >> log.txt
echo ���� >> log.txt
set root >> log.txt
set root1 >> log.txt
set root2 >> log.txt
set root3 >> log.txt
set profile >> log.txt
set profile1 >> log.txt
set profile2 >> log.txt
set profile3 >> log.txt
echo ϵͳ���� >> log.txt
systeminfo >> log.txt
echo ��������˳�
pause > nul
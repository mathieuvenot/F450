@echo off
echo ###################################
echo ### DO NOT CLOSE THIS WINDOW ######
echo ###################################
echo ## THIS WINDOW WILL CLOSE ITSELF ##
echo ###################################
echo ######### www.xs-sol.com ##########
echo ###################################

del /f /q "autoexec.ash"
del /f /q "enable_info_display.script"
del /f /q "READ_ME.txt"
del /f /q "release-notes-YIMAX.txt"
del /f /q "sharpening.config"
del /f /q "xyc.sh"
del /f /q "xyc_presets.sh"


rmdir /s /q "%~dp0\RAW_to_DNG_converter"
rmdir /s /q "%~dp0\SCRIPTS"
rmdir /s /q "%~dp0\XCORING"
rmdir /s /q "%~dp0\XYC_languages"

 
echo MSGBOX "XIMODE was succesfully removed from your SD-Card/ Xiaomi Yi action camera" > %temp%\TEMPmessage.vbs
call %temp%\TEMPmessage.vbs
del %temp%\TEMPmessage.vbs /f /q 

start /b "" cmd /c del /F /Q "%~f0"&exit /b
echo ###################################
echo ########### FINISHED ##############
echo ###################################
ping 127.0.0.1 > nul
exit

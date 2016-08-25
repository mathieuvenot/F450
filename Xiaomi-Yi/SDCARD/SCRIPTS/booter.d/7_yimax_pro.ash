###########################################
#                                         #
#			XIMODE - YIMAX PRO            #
#                                         #
###########################################

#YIMAX PRO
#Mode: Flat videos / Xiaomi's Protune (Mode for postproduction usage)
#Type: Video&photography
#Bitrate: 35Mbit

#-------------------------------------------------------------
#Version: 		2.1.0.
#Date: 			10.06.2016
#Author: 		nutsey (https://www.goprawn.com) ; xs-Sol (xs-sol.com)
#Contact: 		https://www.goprawn.com ; contact@xs-sol.com
#Discussion: 	https://dashcamtalk.com/forum/threads/yimax-pro-script.20108/
#Donate: 		http://tinyurl.com/jantc33  (xs-Sol donation link)(Paypal)
#Description: This script constantly removes 'watercolor' look caused by excessive in-cam image treatment routines. 
#It also provides 'flat' picture which can be used more efficiently during a footage postprocess.
#Additionally, the script enables the most preferred bitrate mode and settings reaching the limits of the hardware.
#videos. (Call it the updated Yimax script from Nutsey)
#-------------------------------------------------------------
#Firmware to use with: Custom 35Mbit 1.2.13 Firmware (by Fried - http://bit.ly/1T13KxG )
#Tested on: SN23A
#-------------------------------------------------------------

#+++++++++ BITRATE AND RESOLUTION ++++++++++

#MAT set video 1080p@60
writeb 0xC06CC426 0x03
writel 0xC05C2CC8 0x04380780

#MAT set 35Mb bitrate for all resolutions
#1280x720 24fps
writew 0xC05C25D2 0x420C
#1280x720 30fps
writew 0xC05C2182 0x420C
#1280x720 48fps
writew 0xC05C25A2 0x420C
#1280x720 60fps
writew 0xC05C2122 0x420C
#1280x720 120fps
writew 0xC05C2812 0x420C
#1280x960 24fps
writew 0xC05C2572 0x420C
#1280x960 30fps
writew 0xC05C22A2 0x420C
#1280x960 48fps
writew 0xC05C2542 0x420C
#1280x960 60fps
writew 0xC05C2272 0x420C
#1600x1200 24fps
writew 0xC05C2512 0x420C
#1600x1200 30fps
writew 0xC05C20C2 0x420C
#1600x1200 48fps
writew 0xC05C24E2 0x420C
#1600x1200 60fps
writew 0xC05C2092 0x420C
#1920x1080 24fps
writew 0xC05C2482 0x420C
#1920x1080 30fps
writew 0xC05C1F72 0x420C
#1920x1080 48fps
writew 0xC05C2452 0x420C
#1920x1080 60fps
writew 0xC05C1EE2 0x420C
#2304x1296 30fps
writew 0xC05C1EB2 0x420C



#writeb 0xC06CC426 0x02

#writeb 0xC05C1EAC 0x05

#writew 0xC05C1EB2 0x4220

#writel 0xC05C1EB4 0x3f400000

#writel 0xC05C1EB8 0x3fa00000


#++++++++++++ CORRECTIONS - VIDEO ++++++++++++++++
#HSV, shadow/highlight clipping, gamma, NR adjustments:
t ia2 -adj ev 10 -1 70 -1 -1 150 -1

t ia2 -adj l_expo 163

t ia2 -adj autoknee 255

t ia2 -adj gamma 160

t ia2 -adj tidx -1 0 -1


#++++++++++++ QUALITY CORRECTIONS ++++++++++++++++

#Set 12 scene mode (change 12 to 9 for low light):
t cal -sc 12

#Enable raw+jpeg stills:
t app test debug_dump 14


#Set file size limit to 4GB:
writew 0xC03A8520 0x2004
sleep 9


###############################################
#		YOUR SCRIPT OVER THIS LINE		      #
###############################################
#+++++++++++++ FINISHED +++++++++++++

#ready beep
t pwm 1 enable
sleep 1
t pwm 1 disable

#Mode 7
t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

t gpio 6 sw out1
sleep 2
t gpio 6 sw out0
sleep 1

#++++++++++++ MAIN LOOP ++++++++++++++++
while true; do
	#Enable AE/AWB/ADJ:
	t ia2 -3a 1 1 0 1
	sleep 1
	#Blink with wifi led:
	#t gpio 114 sw out0
	#t gpio 114 sw out1
	#Load settings from file:
	t cal -ituner load d:\XCORING\goprawn.conf
done

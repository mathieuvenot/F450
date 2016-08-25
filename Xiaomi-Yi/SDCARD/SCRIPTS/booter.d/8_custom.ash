###########################################
#                                         #
#			XIMODE - CUSTOM               #
#                                         #
###########################################

#Author: YOU
#Description: If you want to add your own script to the booter, simply paste it below here.
#Caution, if there are no bitrate changes made, the bitrate resolution stays at 35Mbit.
#If you want to keep the THM files, please remove the "Anything Else" section in 0_default.ash script.
#If the THM should be kept in all the other scripts but not this one, please copy the "Anything Else"
#section into all the other scripts and delete it from the first script.(0_default.ash)

###############################################
#		YOUR SCRIPT BELOW THIS LINE		      #
###############################################


#+++++++++ BITRATE AND RESOLUTION ++++++++++

#set video 1080p@60
writeb 0xC06CC426 0x03
writel 0xC05C2CC8 0x04380780

#set 35Mb bitrate for all resolutions
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


#++++++++++++ CORRECTIONS - VIDEO ++++++++++++++++

#HSV, shadow/highlight clipping, gamma, NR adjustments:
t ia2 -adj ev 10 -1 70 -1 -1 150 -1

#shadow/highlight clipping adjustments
#this makes blacks not crushed
#set long exposure level [0~255]
t ia2 -adj l_expo 163

#this gets back the highlights
#set Auto Knee level [0~255]
t ia2 -adj autoknee 255

#set gamma level [0~255]
t ia2 -adj gamma 160

#set Noise Reduction
# tidx: [ev_idx][nf_idx][shutter_idx], -1 disable
# [nf_idx]: 0-16383
t ia2 -adj tidx -1 0 -1


#++++++++++++ QUALITY CORRECTIONS ++++++++++++++++

#enable scene mode
# [1/13/14]: auto/landscape/portrait
# [34/38]: through_glass/car_DV
t cal -sc 12

#create RAW files
t app test debug_dump 14

#set JPEG quality to 100%
t cal -jqlt 100

#set 4GB file weight limit
writew 0xC03A8520 0x2004

#set AAA function
# -3a [ae][awb][af][adj]: turn on/off ae/awb/af/adj
#  ae = [0|1], 0:on 1:off AE
#  awb = [0|1], 0:on 1:off AWB
#  af  = [0|1], 0:on 1:off AF
#  adj = [0|1], 0:on 1:off ADJ
#t ia2 -3a 1 1 0 1


###############################################
#		YOUR SCRIPT OVER THIS LINE		      #
###############################################
#+++++++++++++ FINISHED +++++++++++++

#ready beep
t pwm 1 enable
sleep 1
t pwm 1 disable

#Mode 8
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
# Generated by XYC 1.0.1 Alex, Thu Jan  1 00:01:58 UTC 1970
# https://github.com/alex-agency/XYC
########################################### 
# XIAOMI YI AUTOEXEC.ASH GENERATOR
# ASH.BOOTER v0.3 (2015-12-18)
#
# by Halvaborsch <dsequence@gmail.com> 
# https://github.com/halvaborsch/ash.booter
#
###########################################
# DO NOT REMOVE! BOOTER SHOULD BE FIRST
sleep 3
lu_util exec '/tmp/fuse_d/SCRIPTS/booter.sh'
# DO NOT REMOVE! BOOTER SHOULD BE FIRST 
#
#
#
###########################################
## XIMODE CUSTOM SCRIPT WITH TELNET ##
###########################################

# 
# 
# 
#set JPEG quality to 100%
t cal -jqlt 100

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
t ia2 -adj tidx -1 -1 -1

#Sharpness: 0 50 128
#set sharpness
t is2 -shp mode 0
t is2 -shp fir 50 0 0 0 0 0 0
t is2 -shp max_change 5 5
t is2 -shp cor d:\sharpening.config
sleep 1

#set video 
writeb 0xC06CC426 0x03
writel 0xC05C2CC8 0x04380780

#set  bitrate for all resolutions
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

#set 4GB file weight limit
writew 0xC03A8520 0x2004

#set AAA function
# -3a [ae][awb][af][adj]: turn on/off ae/awb/af/adj
#  ae = [0|1], 0:on 1:off AE
#  awb = [0|1], 0:on 1:off AWB
#  af  = [0|1], 0:on 1:off AF
#  adj = [0|1], 0:on 1:off ADJ
t ia2 -3a 1 1 0 1

#Greeting script
#front led blink
t gpio 6 sw out1
sleep 1
t gpio 6 sw out0
t gpio 54 sw out1
sleep 1
t gpio 54 sw out0
#short beep & front leds
t gpio 6 sw out1
t gpio 54 sw out1
t pwm 1 enable
sleep 1
t gpio 6 sw out0
t gpio 54 sw out0
t pwm 1 disable

#AUTOREC script by nutsey
sleep 10
t app key record

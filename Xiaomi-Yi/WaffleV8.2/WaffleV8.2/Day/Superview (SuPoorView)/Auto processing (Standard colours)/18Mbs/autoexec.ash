# WaffleFPV V8 

#--Recording Adjustments--
# 4GB Clipping
writew 0xC03A8520 0x2004
# Sets Bitrate to 18Mbs.
writew 0xC05C2092 0x4190
# Superview Stretch
writeb 0xC06CC426 0x0C
writel 0xC05C2D7C 0x04380780

#--Sharpness Adjustments--
# Coring
t is2 -shp mode 0
t is2 -shp max_change 5 5
t is2 -shp cor d:\coring.txt
sleep 1
# Noise adjust 
t ia2 -adj tidx -1 1024 -1

#--Misc. Adjustments--
# Short Beep once script fully loaded
t pwm 1 enable
sleep 1
t pwm 1 disable

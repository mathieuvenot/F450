# WaffleFPV V8 

#--Recording Adjustments--
# 4GB Clipping
writew 0xC03A8520 0x2004
# Sets Bitrate to 18Mbps
writew 0xC05C1EE2 0x4190

#--Sharpness Adjustments--
# Coring
t is2 -shp mode 0
t is2 -shp max_change 5 5
t is2 -shp cor d:\coring.txt
sleep 1
# Noise adjust 
t ia2 -adj tidx -1 1024 -1

#--Lighting Adjustments--
# Shadow/Highlights 
t ia2 -adj l_expo 163
t ia2 -adj autoknee 200
# Colour enhancement
t ia2 -adj ev 10 0 70 0 0 150 0
# Gamma adjustment
t ia2 -adj gamma 160
# ae/awb/adj fix 
t ia2 -3a 1 1 0 1

#--Misc. Adjustments--
# Short Beep once script fully loaded
t pwm 1 enable
sleep 1
t pwm 1 disable

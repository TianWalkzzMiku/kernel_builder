#!/bin/bash

export KERNELNAME=Hyper-

export LOCALVERSION=Ryzen-SeaGames-V21-beta

export KBUILD_BUILD_USER=Tiannn

export KBUILD_BUILD_HOST=Mob-Psycho

export TOOLCHAIN=clang

export DEVICES=whyred,tulip,lavender

source helper

gen_toolchain

send_msg "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: whyred - tulip"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do
      if [ $i == "whyred" ] || [ $i == "tulip" ]
       then
	       build ${i} -oldcam

	       build ${i} -newcam
       fi
done

send_msg "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: lavender"

for i in ${DEVICES//,/ }
do
       if [ $i == "lavender" ]
       then
	        build ${i} -oldcam

	        build ${i} -newcam
       fi
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "✅ Build completed in $((DIFF / 60))m $((DIFF % 60))s | Linux version : $(make kernelversion) | Last commit: $(git log --pretty=format:'%s' -5)"

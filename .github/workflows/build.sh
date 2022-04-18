#!/bin/bash

export KERNELNAME=SuperRyzen-CAF-Beta

export KBUILD_BUILD_USER=TianWalkzzMiku

export KBUILD_BUILD_HOST=Whyred@Sangarr

export TOOLCHAIN=clang

export DEVICES=whyred

source helper

gen_toolchain

send_msg "⏳ Start building ${KERNELNAME} ${LOCALVERSION} | DEVICES: whyred"

START=$(date +"%s")

for i in ${DEVICES//,/ }
do
       if [ $i == "whyred" ]
       then
	       build ${i} -oldcam
       fi
done

END=$(date +"%s")

DIFF=$(( END - START ))

send_msg "✅ Build completed in $((DIFF / 60))m $((DIFF % 60))s | Linux version : $(make kernelversion) | Last commit: $(git log --pretty=format:'%s' -5)"

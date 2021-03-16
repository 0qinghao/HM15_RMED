#!/bin/bash

SeqName=(PeopleOnStreet Traffic BasketballDrive BQTerrace Cactus Kimono ParkScene BasketballDrill BQMall PartyScene RaceHorsesC BasketballPass BlowingBubbles BQSquare RaceHorses FourPeople Johnny KristenAndSara Vidyo1 Vidyo3 Vidyo4 BasketballDrillText ChinaSpeed SlideEditing SlideShow)

para="--FramesToBeEncoded=1"

basedir=$(pwd)
cd $basedir/bin

for i in "${!SeqName[@]}"; do
    {
        echo "Encoding "${SeqName[$i]}
        ./TAppEncoderStatic -c ../cfg/encoder_intra_main_LL.cfg -c ../cfg/per-sequence/${SeqName[$i]}.cfg $para
        echo "Decoding "${SeqName[$i]}
        ./TAppDecoderStatic -b ./${SeqName[$i]}.bin -o ${SeqName[$i]}_dec.yuv > ../Matlab/${SeqName[$i]}.log
    }&
done

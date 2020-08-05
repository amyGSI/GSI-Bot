#!/bin/bash
# Sync
telegram -M "Generic ($ROM_GENERIC): Process started"
SYNC_START=$(date +"%s")

sudo ./ErfanGSIs/url2GSI.sh $ROM_LINK Generic:$ROM_GENERIC
    mkdir final

    SYNC_END=$(date +"%s")
    SYNC_DIFF=$((SYNC_END - SYNC_START))
    telegram -M "Generic ($ROM_GENERIC): Build completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

    SYNC_START=$(date +"%s")
    telegram -M "Generic ($ROM_GENERIC): Zipping output started"

    export date2=`date +%Y%m%d`
    export sourcever2=`cat ./ErfanGSIs/ver`
    sudo chmod -R 777 ErfanGSIs/output
               
    cd ErfanGSIs/output/
               
    curl -sL https://git.io/file-transfer | sh
               
    zip -r $ROM_GENERIC-AB-$sourcever2-$date2-ErfanGSI-YuMiGSI.zip *-AB-*.img
    zip -r $ROM_GENERIC-Aonly-$sourcever2-$date2-ErfanGSI-YuMiGSI.zip *-Aonly-*.img

    SYNC_END=$(date +"%s")
    SYNC_DIFF=$((SYNC_END - SYNC_START))
    telegram -M "Generic ($ROM_GENERIC): Zipping completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds"

    SYNC_START=$(date +"%s")
    telegram -M "Generic ($ROM_GENERIC): Upload started for Mirrors: GOF, WET & SourceForge"
    
    # GOF
    echo "::set-env name=DOWNLOAD_A::$(./transfer $MIR "$ROM_GENERIC-Aonly-$sourcever2-$date2-ErfanGSI-YuMiGSI.zip" | grep -o -P '(?<=Download Link: )\S+')"
    echo "::set-env name=DOWNLOAD_AB::$(./transfer $MIR "$ROM_GENERIC-AB-$sourcever2-$date2-ErfanGSI-YuMiGSI.zip" | grep -o -P '(?<=Download Link: )\S+')"

    # WET
    echo "::set-env name=WET_DOWNLOAD_A::$(./transfer wet "$ROM_GENERIC-Aonly-$sourcever2-$date2-ErfanGSI-YuMiGSI.zip" | grep -o -P '(?<=Download Link: )\S+')"
    echo "::set-env name=WET_DOWNLOAD_AB::$(./transfer wet "$ROM_GENERIC-AB-$sourcever2-$date2-ErfanGSI-YuMiGSI.zip" | grep -o -P '(?<=Download Link: )\S+')"
    
    # SourceForge
    chmod +x /home/runner/work/GSI-Bot/GSI-Bot/Generic/upload.sh
    ./home/runner/work/GSI-Bot/GSI-Bot/Generic/upload.sh

    SYNC_END=$(date +"%s")
    SYNC_DIFF=$((SYNC_END - SYNC_START))
    telegram -M "Generic ($ROM_GENERIC): Uploading completed successfully in $((SYNC_DIFF / 60)) minute(s) and $((SYNC_DIFF % 60)) seconds."

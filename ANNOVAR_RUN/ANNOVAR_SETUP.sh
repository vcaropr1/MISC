#! /bin/bash

SAMPLE_SHEET=$1

CORE_PATH='/isilon/sequencing/Seq_Proj'

for SAMPLE in $(awk 'BEGIN{FS=","} NR>1 {print $1","$8}' $SAMPLE_SHEET | uniq )
 do
 PROJECT=$(echo $SAMPLE | awk 'BEGIN{FS=","} {print $1}')
 SM_TAG=$(echo $SAMPLE | awk 'BEGIN{FS=","} {print $2}')

 mkdir -p $CORE_PATH/$PROJECT/TEMP/ANNOVAR_TEMP
 cp $CORE_PATH/$PROJECT/VCF/RELEASE/FILTERED_ON_BAIT/$SM_TAG* $CORE_PATH/$PROJECT/TEMP/ANNOVAR_TEMP
done
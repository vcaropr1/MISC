#! /bin/bash

PROJECT=$1
QC_REPORT=$2
MULTI_SAMPLE_VCF=$3

CORE_PATH="/isilon/sequencing/Seq_Proj/"
REF_GENOME="/isilon/sequencing/GATK_resource_bundle/bwa_mem_0.7.5a_ref/human_g1k_v37_decoy.fasta"
JAVA_1_7="/isilon/sequencing/Kurt/Programs/Java/jdk1.7.0_25/bin"
GATK_DIR="/isilon/sequencing/CIDRSeqSuiteSoftware/gatk/GATK_3/GenomeAnalysisTK-3.3-0"

SCRIPT_DIR="/isilon/sequencing/VITO/SCRIPTS/FAMILY_BREAKOUT_MS"

if [ -d $CORE_PATH/$PROJECT/Release_Data/rawdataset_to_PI/Family_Vcfs/ ]
then
	rm -rf $CORE_PATH/$PROJECT/Release_Data/rawdataset_to_PI/Family_Vcfs/
fi


for FAMILY in $(awk 'BEGIN{FS=","} NR>1 {print $139}' $QC_REPORT | sort | uniq)
do
	mkdir -p $CORE_PATH/$PROJECT/Release_Data/rawdataset_to_PI/Family_Vcfs/$FAMILY
	awk 'BEGIN{FS=","} $139 ~ "'$FAMILY'" {print $2}' $QC_REPORT >> $CORE_PATH/$PROJECT/Release_Data/rawdataset_to_PI/Family_Vcfs/$FAMILY/$FAMILY"_family_sample.list"
	echo \
 qsub \
 -N SELECT_VARIANTS_FOR_FAMILY_$FAMILY \
 -j y -o $CORE_PATH/$PROJECT/LOGS/SELECT_VARIANTS_FOR_FAMILY_$FAMILY.log \
 $SCRIPT_DIR/SELECT_VARIANTS_FOR_FAMILY.sh \
 $JAVA_1_7 $GATK_DIR $CORE_PATH \
 $PROJECT $FAMILY $REF_GENOME $MULTI_SAMPLE_VCF
done
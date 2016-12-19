# ---qsub parameter settings---
# --these can be overrode at qsub invocation--

# tell sge to execute in bash
#$ -S /bin/bash

# tell sge to submit any of these queue when available
#$ -q prod.q,rnd.q,test.q

# tell sge that you are in the users current working directory
#$ -cwd

# tell sge to export the users environment variables
#$ -V

# tell sge to submit at this priority setting
#$ -p -10

# tell sge to output both stderr and stdout to the same file
#$ -j y

# export all variables, useful to find out what compute node the program was executed on
# redirecting stderr/stdout to file as a log.

set

JAVA_1_7=$1
GATK_DIR=$2
CORE_PATH=$3

PROJECT=$4
FAMILY=$5
REF_GENOME=$6
MULTI_SAMPLE_VCF=$7

$JAVA_1_7/java -jar $GATK_DIR/GenomeAnalysisTK.jar \
-T SelectVariants \
--disable_auto_index_creation_and_locking_when_reading_rods \
-R $REF_GENOME \
-env \
--sample_file $CORE_PATH/$PROJECT/Release_Data/rawdataset_to_PI/Family_Vcfs/$FAMILY/$FAMILY"_family_sample.list" \
--variant $MULTI_SAMPLE_VCF \
-o $CORE_PATH/$PROJECT/Release_Data/rawdataset_to_PI/Family_Vcfs/$FAMILY/$PROJECT".VQSR.ANNOTATED.JUST_FAMILY_"$FAMILY"_VARIANT_ONLY.vcf"
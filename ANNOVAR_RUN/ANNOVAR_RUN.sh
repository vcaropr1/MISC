#! /bin/bash

PROJECT=$1
CIDR_SEQSUITE_JAVA='/isilon/sequencing/CIDRSeqSuiteSoftware/java/jre1.6.0_25/bin'
CIDR_SEQSUITE_DIR_4_0='/isilon/sequencing/CIDRSeqSuiteSoftware/Version_4_0'
CORE_PATH='/isilon/sequencing/Seq_Proj/'

$CIDR_SEQSUITE_JAVA/java \
-jar $CIDR_SEQSUITE_DIR_4_0/CIDRSeqSuite.jar \
-pipeline \
-annovar_directory_annotation $CORE_PATH/$PROJECT/TEMP/ANNOVAR_TEMP/ $CORE_PATH/$PROJECT/TEMP/ANNOVAR_TEMP/

du -ah $CORE_PATH/$PROJECT/TEMP/ANNOVAR_TEMP | egrep "csv|txt" | awk '{print "mv -v",$2,"'$CORE_PATH'""/""'$PROJECT'""/REPORTS/ANNOVAR/"}' | bash

rm -rvf $CORE_PATH/$PROJECT/TEMP/ANNOVAR_TEMP
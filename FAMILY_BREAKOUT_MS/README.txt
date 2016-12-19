These two scripts work together to make family only vcfs from a multi-sample vcf.  

The FAMILY_VCF_BREAKOUT_SUBMITTER.sh takes the following arguements
	1 - Project Name
	2 - QC_REPORT
	3 - MS_VCF

This script will generate sample_lists per family and output a qsub command for each family.  The output will be in the Release_Data/rawdataset_to_PI directory.  

This will group families only.  If there are multiple hapmap samples across multiple families that are desired to be in one vcf file.  This is not that.  

If these scripts are downloaded to be used.  One must change the SCRIPT_DIR path found in the FAMILY_VCF_BREAKOUT_SUBMITTER script to the desired location
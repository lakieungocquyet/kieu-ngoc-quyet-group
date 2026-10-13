SAMPLE_READ1_FILE_PATH=
SAMPLE_READ2_FILE_PATH=

REFERENCE_GENOME_FILE_PATH=

BED_FILE=

BQSR_KNOWN_SITES1=
BQSR_KNOWN_SITES2=
BQSR_KNOWN_SITES3=

DBSNP138_ANNOTATION_RESOURCE=
CLINVAR_ANNOTATION_RESOURCE=
DBNSFP_ANNOTATION_RESOURCE=
ESP6500_ANNOTATION_RESOURCE=
PHASE3_1000G_ANNOTATION_RESOURCE=

THREADS=8




/usr/bin/time -v -a -o "${WORKFLOW_RUNTIME_LOG_FILE_PATH}" bash -c "
    bwa mem -t ${THREADS} \
        -R \"@RG\tID:${sample_id}\tLB:lib1\tPL:${sample_platform}\tPU:unit1\tSM:${sample_id}\" \
        \"${REFERENCE_GENOME_FILE_PATH}\" \
        \"${sample_read1}\" \
        \"${sample_read2}\" | \
    samtools sort -@ ${THREADS} -o \"${OUTPUT_DIR_PATH}/${sample_id}/${sample_id}.sorted.bam\"
"


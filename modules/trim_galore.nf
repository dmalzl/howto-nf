process TRIM_GALORE {
    tag "$sample_id"

    input:
    val sample_id
    path fastq

    output:
    val sample_id
    path "${sample_id}_trimmed.fq.gz"

    script:
    '''
    trim_galore ... \
        --basename ${sample_id} \
        ${fastq}
    '''
}

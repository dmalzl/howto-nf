process MACS2_CALL_PEAKS {
    tag "$sample_id"

    publishDir  path: params.outdir,
                mode: 'copy',
                pattern: "*.bed"

    input:
    val sample_id
    path aligned_reads

    output:
    path "${sample_id}.peaks.bed", emit: peaks

    script:
    '''
    macs2 -t ${aligned_reads} -o ${sample_id}.peaks.bed
    '''
}

process ALIGN_BOWTIE2 {
    tag "$sample_id"

    publishDir  path: params.outdir,
                mode: 'copy',
                pattern: "*.bam"

    input:
    val sample_id
    path trimmed_fastq

    output:
    val sample_id
    path "${sample_id}.bam", emit: bam

    script:
    '''
    bowtie2 ... ${trimmed_fastq} ${sample_id}.bam
    '''
}

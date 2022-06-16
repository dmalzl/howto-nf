nextflow.enable.dsl=2

params.samples=''
params.index=''
params.outdir='results'

include { CHIPSEQ  } from 'workflows/chipseq'

// read group_id, fastq file from input
Channel
    .from(file(params.samples, checkIfExists: true))
    .splitCsv(header: true)
    .set { ch_samples }

workflow {
    CHIPSEQ ( ch_samples )
}

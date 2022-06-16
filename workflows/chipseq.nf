include { TRIM_GALORE       } from '../modules/trim_galore'
include { ALIGN_BOWTIE2     } from '../modules/align_bowtie2'
include { MACS2_CALL_PEAKS  } from '../modules/macs2_call_peaks'

workflow {
    take:
    ch_samples

    main:
    ch_samples | \
    TRIM_GALORE | \
    ALIGN_BOWTIE2 | \
    MACS2_CALL_PEAKS

    emit:
    bam = ALIGN_BOWTIE2.out.bam
    peaks = MACS2_CALL_PEAKS.out.peaks
}

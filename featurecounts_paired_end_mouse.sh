#!/bin/bash

#  Created by Jonas Metz on 12.10.22.

# set parameters
dir_with_processed_fastqs=/path_to/lab4097_STAR
gtffile=/path_to/Mus_musculus.GRCm39.108.gtf
format=.fastq.gz

# create list with read1 files (one file per sample)
files=$(find $dir_with_processed_fastqs -maxdepth 10 -regex '.*'$format -print)
R1_reads=$( printf '%s\n' "${files[@]}" | grep 'R1' )

# create output directories
cd "$dir_with_processed_fastqs"
#mkdir STARout_unmask
mkdir featureCountsout_unmask_paired_param_40

# load modules
module load subread/1.6.5

# counting reads per gene
bams=$(find "${dir_with_processed_fastqs}"/STARout_unmask_param_040/ -maxdepth 1 -name '*.bam')

featureCounts -p -B \
                    -T 12 -t exon \
                      -g gene_id \
                      -a ${gtffile} \
                      -o "${dir_with_processed_fastqs}"/featureCountsout_unmask_paired_param_40/fcounts.txt \
                      ${bams}








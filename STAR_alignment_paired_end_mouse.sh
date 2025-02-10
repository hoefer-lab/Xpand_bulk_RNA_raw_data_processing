#!/bin/bash

#  STAR_alignment_paired_end_mouse.sh
#  Created by Jonas Metz on 12.10.22.
#

# set parameters
dir_with_processed_fastqs=/path_to/lab4097_STAR
genome_directory=/path_to/mm39_genome_unmask/
gtffile=/path_to/Mus_musculus.GRCm39.108.gtf
format=.fastq.gz

# create list with read1 files (one file per sample)
files=$(find $dir_with_processed_fastqs -maxdepth 1 -regex '.*'$format -print)
R1_reads=$( printf '%s\n' "${files[@]}" | grep 'R1' )

# create output directories
cd "$dir_with_processed_fastqs"
new_dir_name=STARout_unmask_param_040
mkdir "${new_dir_name}"


# star only produces one bam file per run; that is why we need to loop over the samples
for R1_path in $R1_reads; do
    R1_file_name=$(echo "${R1_path}" | rev | cut -d "/" -f 1 | rev)
    sample_ID=$(echo "${R1_file_name}" | cut -d "_" -f 1)
    R2_file_name=${R1_file_name/R1/"R2"}
    R2_path="$dir_with_processed_fastqs"/"$R2_file_name"
    Prefix_output="${dir_with_processed_fastqs}"/"${new_dir_name}"/"${sample_ID}"_
    peOverlapNbasesMin=10
    outFilterScoreMinOverLread=40
    # run star
    bsub -R "rusage[mem=64G]" -q verylong source /path_to/STAR_core_alignment_paired_end.sh ${genome_directory} ${R1_path} ${R2_path} ${Prefix_output} ${peOverlapNbasesMin} ${outFilterScoreMinOverLread}
done








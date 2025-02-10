#!/bin/bash

#  STAR_alignment_paired_end_mouse.sh
#  Created by Jonas Metz on 12.10.22.

# load modules
module load star/2.7.10a

    
STAR --genomeDir $1 \
--genomeLoad NoSharedMemory \
--runThreadN 12 \
--readFilesIn $2 $3 \
--readFilesCommand gunzip -c \
--outFilterMultimapNmax 1 \
--outFileNamePrefix $4 \
--outSAMtype BAM SortedByCoordinate \
--outSAMunmapped Within \
--outSAMattributes Standard \
--peOverlapNbasesMin $5 \
--outFilterScoreMinOverLread 0.$6 --outFilterMatchNminOverLread 0.$6  --outFilterMatchNmin 0









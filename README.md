# Xpand_bulk_RNA_raw_data_processing

The STAR_alignment_paired_end_mouse.sh file initiates the alignment of all samples by looping over them.
It also specifies the alignment parameters that are passed on to the actual call of the alignment function in STAR_core_alignment_paired_end.sh.
In featurecounts_paired_end_mouse.sh, the overlaps of aligned reads with exons of the mouse genome are counted per gene. This is done simultaneously for all samples.

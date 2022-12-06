RNA structure in IGV ARC diagram visualizing base pairing probabilities from integrated probing data

#initiate interactive session 

srun --cpus=4 --mem=16G --time=2:00:00 --pty bash

#load RNA structure package 

module load rnastructure/6.2

#partition-smp

partition-spm {mcl1.fasta} {mcl1_partition.pfs} --SHAPE {mcl1_shape.shape}


#probability plot
ProbabilityPlot {mcl1_partition.pfs} {mcl1_bp_probs.dp} -t

#take probability plot output and ref fasta into IGV

1. open IGV
2. Genomes > load genome from file > select ref.fasta from local
	- IGV automatically generates referance index (samtools faidx can do this too)
	- mcl1.fasta
#load the probability plot, generate the arc diagram
3. select File > load from file > mcl1_bp_probs.dp
	- IGV automatically generates the out.bp file a readable bp probs file and the arc diagram in the GUI
	- mcl1_bp_probs.dp

#Alternative
#load arc diagram to annotated Hg38 coordinates in IGV
1. open IGV
2. Select Human (GRCh38/hg38)

3. select File > load from file > mcl1_bp_probs.dp
	- you will be prompted to input the coordinates so that IGV knows where to mape the ARC diagram too
	- you will subsequently select the appropriate {chr, start, end} coordinates of the construct being plotted
	- strandedness will determine ARC plot orientation to the annotation, be sure to consider this. 

#manipulate ARC plot in IGV
1. right click on the arc plot track (far left box that says "mcl1_bp_probs"
2. select Tracks > Fit data to window

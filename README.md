# CODE-Evolution-of-Drosophila-Walking
Created by: Brandon Pratt
Date: 05/21/2021
This work is in collaboration with Ryan York from the Clandinin lab at Stanford University and Su-Yee Lee from the Tuthill lab at the University of Washington.
Contained is the code used to analyze the interlimb coordination and walking kinematics of various Drosophila species.

This code automatically and efficiently extracts the head, thorax, and abdomen positions from csv files obtained from Deeplabcut tracking.
Importantly, this code concatenates the tracked data of sequential move segments. Note that we had to segment the original videos of flies walking in the experimental chamber due to their size (i.e. the original videos were too large to import into python or MATLAB)

This code outputs the following:
1) CSV file of the number of legs in stance (i.e. the legs touching the ground at the same time).
2) CSV file of the Maximum Likelihoods of the tracking positions.
3) CSV file of swing and stance matrices - the temporal sequence of legs in swing or stance.
4) CSV file of the positions of the head, thorax, abdomen as well as the smoothed positions of the leg tarsi.  

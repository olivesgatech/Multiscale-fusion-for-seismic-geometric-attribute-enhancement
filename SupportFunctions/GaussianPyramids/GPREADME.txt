This contains the code for the 'Expand' and 'Reduce' routines for Gaussian image pyramids, as discussed in the Paper - "
The Laplacian Pyramid as a Compact Image Code" - Burt and Adelson, 1983. 

Important applications of the same include motion estimation etc.


This package contains two files - 

Expand.m  - Function containing the Expand Routine of Gaussian Image Pyramids
Reduce.m  - Function containing the Reduce Routine of Gaussian Image Pyramids

- Deshan Yang
Email: dyangchicago@yahoo.com

These two functions were originally submitted by Karthik Kumar Arun Kumar, E-mail: karunkum@ucsc.edu.
Karthik's functions were working only for 2D images, and they were relatively slow.

I have improved both functions to make them working for 1D, 2D and 3D images. Output images will have
the same data type of the original image, and both functions are working much faster now.


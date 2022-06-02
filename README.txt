Wessler
2022 May 26


Code used for analysis of data for Amanda Travis et al. 2022.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Summary of files included
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Note: all code has descriptions in headers and is commented throughout.


* main_MeasureMigration.m
	This is the code to run. It reads data, computes relative distance of nuclei from OPL, computes some statistics, plots histogram of distances, and saves results.

* inputs_MigrationAlgorithm.m
	Contains the inputs for what/how the code is run. This should be the only file that needs to be edited run to run.

* Functions/func_InitializeAlgorithm.m
	Reads data then puts data and inputs in format for code.

* Functions/func_ComputeDistances.m
	Runs "func_DefinePlane.m" and "func_FindDistanceFromPlane.m" to find the distance of each nucleus from ONL and OPL.

* Functions/func_DefinePlane.m
	Takes 3 3d points and gives coefficients A, B, C, and D to define the plane described by the 3 points using the equation Ax+By+Cz+D=0.

* Functions/func_FindDistanceFromPlane.m
	Finds the distance of each point (given by a list of 3d coordinates) from the plane described by the equation Ax+By+Cz+D=0 (where A, B, C, and D are given).

* Functions/func_ComputeStatistics.m
	Computes various statistics about the distances of nuclei from ONL and OPL.


* Functions/func_MakeHistogram.m
	Plots a histogram of distances of nuclei from OPL.

* Functions/func_SaveData_MigrationAlgorithm.m
	Saves the entire MATLAB session as a .mat and the relative distances of nuclei from OPL as a .txt.

* DataSample444-2.xlsx
	Sample data in the format used by the algorithm.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Run instructions
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

(1) Place data file in the directory with "main_MeasureMigration.m", "inputs_MigrationAlgorithm.m", and "Functions/".

(2) Edit "inputs_MigrationAlgorithm.m" to include the data file name and any customizations to how outputs will (or won't) be saved and appear.

(3) Run "main_MeasureMigration.m".







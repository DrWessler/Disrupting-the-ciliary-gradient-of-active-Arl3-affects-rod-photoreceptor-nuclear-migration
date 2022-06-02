%{
Name:
    main_MigrationAlgorithm


Version:
    Wessler
    2022 May 17
    Public Version


Description:
    *Code for Travis et al. 2022
    *Calculates the distance of nuclei from the OPL


Inputs:
    Data from input file--ex. "DataSample444-2.xlsx"
    Format: Nx3 table (N>=4)
    row 1: (xmax, ymax, zmax)
    row 2: (y when x0 and z0 on OPL, y when x0 and zmax on OPL, y when xmax and zmax on OPL)
    row 3: (y when x0 and z0 on ONL, y when x0 and zmax on ONL, y when xmax and zmax on ONL)
    rows 4 to N: (xpt, ypt, zpt)


Outputs:
    *Directory for data set
    *Directory contains distance data (.txt)
    *Directory contains Histogram of distance data (.png)


Used by:
    NOTHING--this is the main script


Uses:
    *Inputs_MigrationAlgorithm.m (file to be edited to instruct what/how
algorithm does)
    *func_ComputeDistances.m (function that runs "func_DefinePlane.m" and "func_FindDistanceFromPlane.m")
    *func_DefinePlane.m (function to define a plane given 3 3d points)
    *func_FindDistanceFromPlane.m (function to find distance between 3d point and a plane)
    *func_ComputeStatistics.m (analyzes data and computes statistics)
    *func_MakeHistogram.m
    *data file (ex. Data_Sample444-2.xlsx)


NOTES:
    *This is the script to run!
    *This is the code used in Travis et al. 2022

%}


clear %clears all terms in the session

addpath("Functions/") %permits code in directory "Functions" to be used


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%* read in terms for how/what algorithm does
inputs_MigrationAlgorithm




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INITIALIZE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%* initialize so algorithm can be run
func_InitializeAlgorithm




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPUTE DISTANCES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%* compute raw distances of nuclei from ONL and OPL
[ONL_NucleiDistancesFromPlane,OPL_NucleiDistancesFromPlane]=func_ComputeDistances(List_NucleiCoords,SpecialCoords);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANALYZE DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%* calculate statistics that may be useful for analysis
[Data_ONL,Data_OPL,Data_Other]=func_ComputeStatistics(ONL_NucleiDistancesFromPlane,OPL_NucleiDistancesFromPlane,StatisticsParams);

Distance_FromOPL_Fraction_ALL=Data_OPL.NucleiFractionalDistancesFromPlane_All;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SAVE DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%* save
func_SaveData_MigrationAlgorithm




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MAKE PLOT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%* make histogram of data
func_MakeHistogram(Distance_FromOPL_Fraction_ALL,HistogramParams);




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% END PROGRAM
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

fprintf('\n\n\nFinished.\n\n\n')












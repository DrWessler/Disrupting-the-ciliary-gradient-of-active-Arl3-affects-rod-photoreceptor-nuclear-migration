%{
Name:
    inputs_MigrationAlgorithm


Version:
    Wessler
    2022 May 17
    Public Version


Description:
    *Contains all inputs to run code
    *Should be the only code to edit run to run


Inputs:
    Data from input file--ex. "DataSample444-2.xlsx"
    Format: Nx3 table (N>=4)
    row 1: (xmax, ymax, zmax)
    row 2: (y when x0 and z0 on OPL, y when x0 and zmax on OPL, y when xmax and zmax on OPL)
    row 3: (y when x0 and z0 on ONL, y when x0 and zmax on ONL, y when xmax and zmax on ONL)
    rows 4 to N: (xpt, ypt, zpt)


Outputs:
    NOTHING--this defines all input terms


Used by:
    *main_MigrationAlgorithm.m


Uses:
    *data file (ex. Data_Sample444-2.xlsx)


NOTES:

%}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INPUTS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%--------------------------------------------------------------------------
%name of input file
%--------------------------------------------------------------------------
Inputs_FileName='DataSample444-2';
Inputs_FileType='.xlsx';


%--------------------------------------------------------------------------
%Output File Inputs
%--------------------------------------------------------------------------

%codes: 1=yes; 2=no
Code_SaveMatlabSession=1; %saves .mat of whole matlab session
Code_SaveDistanceData=1; %saves .txt of distance from OPL
Code_SaveHitogram=1; %saves .png of histogram of distances from OPL

OutputDirectory_Name=['Outputs_',Inputs_FileName];
OutputFile_Name_MatlabSession='FullSession.mat';
OutputFile_Name_DistanceData='DistanceFromOPL.txt';
OutputFile_Name_Histogram='Histogram.png';


OutputFile_DistanceData_FORMAT='%12.10f\n'; %XX.YY means "XX" character spaces with "YY" digits behind the decimal place



%--------------------------------------------------------------------------
%Histogram Customization
%--------------------------------------------------------------------------

Histogram_BinWidth=0.1; %how large each bin is
Histogram_BinLimits=[-0.2,1.1]; %min and max of histogram

Axes_FontSize=22;
Axes_Title_String_FORMAT='Distance from OPL--Sample: %s';
Axes_XLabel_String='Fractional Distance';
Axes_YLabel_String='Frequency Count';

Figure_Number=1; %number of figure window
Figure_Position=[1 1 750 590]; %pixel location (lower left and top right) where figure appears 

























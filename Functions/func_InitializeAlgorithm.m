%{
Name:
    func_InitializeAlgorithm


Version:
    Wessler
    2022 May 17
    Public Version


Description:
    *Initializes the code to run the algorithm. Specifically...
    *Reads data
    *Makes output directory
    *Prepares data to be used by algorithm
    *Defines terms used by other functions


Inputs:
    NOTHING--not a proper function 


Outputs:
    NOTHING--not a proper function, although...
    *Makes output directory
    *Creates useable data terms from input file
    *Makes data structures to be read into other functions


Used by:
    *main_MigrationAlgorithm.m


Uses:
    NOTHING


NOTES:
    *not a proper function so that is easier to use
    
%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% INITIALIZE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



%==========================================================================
%     READ DATA
%==========================================================================

%* if data file exists, read in data
if isfile([Inputs_FileName,Inputs_FileType])
    InputData = readmatrix([Inputs_FileName,Inputs_FileType]);
else
    fprintf('\n\n\nERROR! Enter valid data file name for file in current directory\n\n\n')
    return
end


%==========================================================================
%     MAKE OUTPUT DIRECTORY
%==========================================================================

%* if output directory doesn't exist, create it
if ~exist(OutputDirectory_Name, 'dir')
    mkdir(OutputDirectory_Name)
end

%==========================================================================
%     DEFINE TERMS FROM DATA
%==========================================================================

Dimensions_InputData=size(InputData);

Count_NumberOfNuclei=Dimensions_InputData(1)-3; %from input file formatting: top 3 rows dedicated to other data

List_NucleiCoords=InputData(4:end,1:3); %from input file formatting: nuclei coords begin on row 4 and go to end of file

%--------------------------------------------------------------------------
% special coordinates used to compute nuclear distances from planes in "func_ComputeDistances" function
%--------------------------------------------------------------------------

SpecialCoords.xMax=InputData(1,1); %from input file formatting: max is on top row
SpecialCoords.yMax=InputData(1,2); %from input file formatting: max is on top row
SpecialCoords.zMax=InputData(1,3); %from input file formatting: max is on top row

SpecialCoords.y_OPL_x0_z0=InputData(2,1); %from input file formatting: y when x0,z0 at OPL
SpecialCoords.y_OPL_x0_zMax=InputData(2,2); %from input file formatting: y when x0,zmax at OPL
SpecialCoords.y_OPL_xMax_zMax=InputData(2,3); %from input file formatting: y when xmax,zmax at OPL
SpecialCoords.y_ONL_x0_z0=InputData(3,1); %from input file formatting: y when x0,z0 at ONL
SpecialCoords.y_ONL_x0_zMax=InputData(3,2); %from input file formatting: y when x0,zmax at ONL
SpecialCoords.y_ONL_xMax_zMax=InputData(3,3); %from input file formatting: y when xmax,zmax at ONL

SpecialCoords.x0=0; %assumption made when calibrating scope
SpecialCoords.z0=0; %assumption made when calibrating scope


%--------------------------------------------------------------------------
% terms that may be used for analyzing data and/or computing statistics in "func_ComputeStatistics" function
%--------------------------------------------------------------------------

StatisticsParams.Count_NumberOfNuclei=Count_NumberOfNuclei;
StatisticsParams.xMax=SpecialCoords.xMax;
StatisticsParams.yMax=SpecialCoords.yMax;
StatisticsParams.zMax=SpecialCoords.zMax;


%--------------------------------------------------------------------------
% terms used in "func_MakeHistogram.m"
%--------------------------------------------------------------------------

HistogramParams.Inputs_FileName=Inputs_FileName;
HistogramParams.Code_SaveHitogram=Code_SaveHitogram;
HistogramParams.OutputDirectory_Name=OutputDirectory_Name;
HistogramParams.OutputFile_Name_Histogram=OutputFile_Name_Histogram;

HistogramParams.Histogram_BinWidth=Histogram_BinWidth;
HistogramParams.Histogram_BinLimits=Histogram_BinLimits;
HistogramParams.Axes_FontSize=Axes_FontSize;
HistogramParams.Axes_Title_String_FORMAT=Axes_Title_String_FORMAT;
HistogramParams.Axes_XLabel_String=Axes_XLabel_String;
HistogramParams.Axes_YLabel_String=Axes_YLabel_String;
HistogramParams.Figure_Number=Figure_Number;
HistogramParams.Figure_Position=Figure_Position;







%{
Name:
    func_ComputeStatistics


Version:
    Wessler
    2022 May 17
    Public Version


Description:
    *Computes statistics from data
    *Importantly, computes fractional distance of nuclei from OPL


Inputs:
    *"ONL_NucleiDistancesFromPlane": raw values of distances
    *"OPL_NucleiDistancesFromPlane": raw values of distances
    *"StatisticsParams": other terms that some statistics may require


Outputs:
    *"Data_ONL": structure with ONL-specific data and statistics
    *"Data_OPL": structure with OPL-specific data and
     statistics--importantly: fractional distance of nuclei from OPL
    *"Data_Other": structure of other data of interest


Used by:
    *main_MigrationAlgorithm.m


Uses:
    NOTHING


NOTES:
    
%}


function [Data_ONL,Data_OPL,Data_Other]=func_ComputeStatistics(ONL_NucleiDistancesFromPlane,OPL_NucleiDistancesFromPlane,StatisticsParams)

Count_NumberOfNuclei=StatisticsParams.Count_NumberOfNuclei;
xMax=StatisticsParams.xMax;
yMax=StatisticsParams.yMax;
zMax=StatisticsParams.zMax;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ANALYZE DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




%* compute some statistics from data--used for analysis and checking validity

Width_All=ONL_NucleiDistancesFromPlane-OPL_NucleiDistancesFromPlane;
Width_Ave=sum(Width_All)/Count_NumberOfNuclei;
Width_Std=std(Width_All);
Volume_Ave=xMax*zMax*Width_Ave;

Count_INL=sum(OPL_NucleiDistancesFromPlane>0);
Count_ONL=sum(OPL_NucleiDistancesFromPlane<0);
Percent_INL=Count_INL/Count_NumberOfNuclei;

Density_NucleiPerVol=Count_NumberOfNuclei/Volume_Ave;
Density_INLPerNucleiPerVol=Count_INL/Density_NucleiPerVol;


Distance_FromOPL_Fraction_ALL=(-OPL_NucleiDistancesFromPlane./Width_All);
Distance_FromOPL_Fraction_Mean=sum(Distance_FromOPL_Fraction_ALL)/Count_NumberOfNuclei;
Distance_FromOPL_Fraction_Std=std(Distance_FromOPL_Fraction_ALL);
Distance_FromOPL_Fraction_StdErr=std(Distance_FromOPL_Fraction_ALL)/sqrt(Count_NumberOfNuclei);
Distance_FromOPL_Fraction_Median=median(Distance_FromOPL_Fraction_ALL);
Distance_FromOPL_Fraction_25Percentile=prctile(Distance_FromOPL_Fraction_ALL,25);
Distance_FromOPL_Fraction_75Percentile=prctile(Distance_FromOPL_Fraction_ALL,75);


Distance_FromONL_Fraction_ALL=Distance_FromOPL_Fraction_ALL(Distance_FromOPL_Fraction_ALL>0);
Dimensions_Distance_FromONL_Fraction_ALL=size(Distance_FromONL_Fraction_ALL);
Count_ONLNuclei=Dimensions_Distance_FromONL_Fraction_ALL(1);

Distance_FromONL_Fraction_Mean=sum(Distance_FromONL_Fraction_ALL)/Count_ONLNuclei;
Distance_FromONL_Fraction_Std=std(Distance_FromONL_Fraction_ALL);
Distance_FromONL_Fraction_StdErr=std(Distance_FromONL_Fraction_ALL)/sqrt(Count_ONLNuclei);
Distance_FromONL_Fraction_Median=median(Distance_FromONL_Fraction_ALL);
Distance_FromONL_Fraction_25Percentile=prctile(Distance_FromONL_Fraction_ALL,25);
Distance_FromONL_Fraction_75Percentile=prctile(Distance_FromONL_Fraction_ALL,75);







Data_Other.Width_All=Width_All;
Data_Other.Width_Ave=Width_Ave;
Data_Other.Width_Std=Width_Std;
Data_Other.Volume_Ave=Volume_Ave;
Data_Other.Count_INL=Count_INL;
Data_Other.Count_ONL=Count_ONL;
Data_Other.Percent_INL=Percent_INL;
Data_Other.Density_NucleiPerVol=Density_NucleiPerVol;
Data_Other.Density_INLPerNucleiPerVol=Density_INLPerNucleiPerVol;

Data_OPL.NucleiFractionalDistancesFromPlane_All=Distance_FromOPL_Fraction_ALL;
Data_OPL.NucleiFractionalDistancesFromPlane_Mean=Distance_FromOPL_Fraction_Mean;
Data_OPL.NucleiFractionalDistancesFromPlane_Std=Distance_FromOPL_Fraction_Std;
Data_OPL.NucleiFractionalDistancesFromPlane_StdErr=Distance_FromOPL_Fraction_StdErr;
Data_OPL.NucleiFractionalDistancesFromPlane_Median=Distance_FromOPL_Fraction_Median;
Data_OPL.NucleiFractionalDistancesFromPlane_25Percentile=Distance_FromOPL_Fraction_25Percentile;
Data_OPL.NucleiFractionalDistancesFromPlane_75Percentile=Distance_FromOPL_Fraction_75Percentile;



Data_ONL.NucleiFractionalDistancesFromPlane_All=Distance_FromONL_Fraction_ALL;

Data_Other.Count_ONLNuclei=Count_ONLNuclei;

Data_ONL.NucleiFractionalDistancesFromPlane_Mean=Distance_FromONL_Fraction_Mean;
Data_ONL.NucleiFractionalDistancesFromPlane_Std=Distance_FromONL_Fraction_Std;
Data_ONL.NucleiFractionalDistancesFromPlane_StdErr=Distance_FromONL_Fraction_StdErr;
Data_ONL.NucleiFractionalDistancesFromPlane_Median=Distance_FromONL_Fraction_Median;
Data_ONL.NucleiFractionalDistancesFromPlane_25Percentile=Distance_FromONL_Fraction_25Percentile;
Data_ONL.NucleiFractionalDistancesFromPlane_75Percentile=Distance_FromONL_Fraction_75Percentile;





end


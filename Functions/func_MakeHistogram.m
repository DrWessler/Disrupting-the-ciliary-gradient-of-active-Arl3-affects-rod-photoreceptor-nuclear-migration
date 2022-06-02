%{
Name:
    func_MakeHistogram


Version:
    Wessler
    2022 May 17
    Public Version


Description:
    *Makes a histogram of fractional distance of nuclei from OPL
    *If option is selected, saves the .png


Inputs:
    *"Distance_FromOPL_Fraction_ALL" (fractional distances being plotted)
    *"HistogramParams" (mostly terms for customizing figure appearance) 


Outputs:
    *Figure
    *(optional) [OutputDirectory_Name,'/',OutputFile_Name_Histogram] (.png)


Used by:
    *main_MigrationAlgorithm.m


Uses:
    NOTHING


NOTES:
    
%}



function []=func_MakeHistogram(Distance_FromOPL_Fraction_ALL,HistogramParams)

Inputs_FileName=HistogramParams.Inputs_FileName;
Code_SaveHitogram=HistogramParams.Code_SaveHitogram;
OutputDirectory_Name=HistogramParams.OutputDirectory_Name;
OutputFile_Name_Histogram=HistogramParams.OutputFile_Name_Histogram;

Histogram_BinWidth=HistogramParams.Histogram_BinWidth;
Histogram_BinLimits=HistogramParams.Histogram_BinLimits;
Axes_FontSize=HistogramParams.Axes_FontSize;
Axes_Title_String_FORMAT=HistogramParams.Axes_Title_String_FORMAT;
Axes_XLabel_String=HistogramParams.Axes_XLabel_String;
Axes_YLabel_String=HistogramParams.Axes_YLabel_String;
Figure_Number=HistogramParams.Figure_Number;
Figure_Position=HistogramParams.Figure_Position;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% MAKE PLOT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(Figure_Number)
clf;

Histogram = histogram(Distance_FromOPL_Fraction_ALL);


%==========================================================================
%     CUSTOMIZE PLOT
%==========================================================================

Axes=gca;
Figure=gcf;

%--------------------------------------------------------------------------
%               HISTOGRAM
%--------------------------------------------------------------------------


Histogram.BinWidth=Histogram_BinWidth;
Histogram.BinLimits=Histogram_BinLimits;


%--------------------------------------------------------------------------
%               AXES
%--------------------------------------------------------------------------

Axes.FontSize=Axes_FontSize;
Axes.Title.String=sprintf(Axes_Title_String_FORMAT,Inputs_FileName);
Axes.XLabel.String=Axes_XLabel_String;
Axes.YLabel.String=Axes_YLabel_String;


%--------------------------------------------------------------------------
%               FIGURE
%--------------------------------------------------------------------------

Figure.Position=Figure_Position;

if Code_SaveHitogram==1
    saveas(Figure,[OutputDirectory_Name,'/',OutputFile_Name_Histogram])
elseif Code_SaveHitogram~=0
    printf('\n\n\nERROR!\n\n\n')
    fprintf('Did not save MATLAB session--enter valid value for "Code_SaveHitogram"\n\n\n')
end





end









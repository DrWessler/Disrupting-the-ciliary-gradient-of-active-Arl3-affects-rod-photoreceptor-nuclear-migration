%{
Name:
    func_SaveData_MigrationAlgorithm


Version:
    Wessler
    2022 May 17
    Public Version


Description:
    *Saves data from code
    *If option is selected, saves the entire MATLAB session in .mat
    *If option is selected, saves the fractional distance from OPL in .txt


Inputs:
    NOTHING


Outputs:
    *(optional) [OutputDirectory_Name,'/',OutputFile_Name_MatlabSession] (.mat)
    *(optional) [OutputDirectory_Name,'/',OutputFile_Name_DistanceData] (.txt)


Used by:
    *main_MigrationAlgorithm.m


Uses:
    NOTHING


NOTES:

%}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SAVE DATA
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


if Code_SaveMatlabSession==1
    save([OutputDirectory_Name,'/',OutputFile_Name_MatlabSession])
elseif Code_SaveMatlabSession~=0
    fprintf('\n\n\nERROR!\n\n\n')
    fprintf('Did not save MATLAB session--enter valid value for "Code_SaveMatlabSession"\n\n\n')
end

if Code_SaveDistanceData==1
    fileID = fopen([OutputDirectory_Name,'/',OutputFile_Name_DistanceData],'w');
    fprintf(fileID,OutputFile_DistanceData_FORMAT,Distance_FromOPL_Fraction_ALL);
    fclose(fileID);
elseif Code_SaveDistanceData~=0
    fprintf('\n\n\nERROR!\n\n\n')
    fprintf('Did not save MATLAB session--enter valid value for "Code_SaveDistanceData"\n\n\n')
end








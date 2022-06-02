%{
Name:
    func_ComputeDistances


Version:
    Wessler
    2022 May 17
    Public Version


Description:
    *From list of nuclei coords and points on planes computes distances of
     all nuclei from the ONL and OPL
    *Runs "func_DefinePlane.m" and "func_FindDistanceFromPlane.m"


Inputs:
    *"List_NucleiCoords" (matrix of nuclei 3d coordinates)
    *"SpecialCoords" (structure with special coordinates used for defining
     planes)


Outputs:
    *"ONL_NucleiDistancesFromPlane" (vector of raw distances of each
     nucleus from the ONL)
    *"OPL_NucleiDistancesFromPlane" (vector of raw distances of each
     nucleus from the OPL)


Used by:
    *main_MigrationAlgorithm.m


Uses:
    *func_DefinePlane.m
    *func_FindDistanceFromPlane.m


NOTES:
    
%}



function [ONL_NucleiDistancesFromPlane,OPL_NucleiDistancesFromPlane]=func_ComputeDistances(List_NucleiCoords,SpecialCoords)


xMax=SpecialCoords.xMax;
yMax=SpecialCoords.yMax;
zMax=SpecialCoords.zMax;
y_OPL_x0_z0=SpecialCoords.y_OPL_x0_z0;
y_OPL_x0_zMax=SpecialCoords.y_OPL_x0_zMax;
y_OPL_xMax_zMax=SpecialCoords.y_OPL_xMax_zMax;
y_ONL_x0_z0=SpecialCoords.y_ONL_x0_z0;
y_ONL_x0_zMax=SpecialCoords.y_ONL_x0_zMax;
y_ONL_xMax_zMax=SpecialCoords.y_ONL_xMax_zMax;
x0=SpecialCoords.x0;
z0=SpecialCoords.z0;




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMPUTE DISTANCES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==========================================================================
%     DISTANCE FROM ONL PLANE
%==========================================================================

%--------------------------------------------------------------------------
%               DEFINE TERMS USED BY FUNCTION
%--------------------------------------------------------------------------

%* define 3 coordinate points from the ONL in order to determine
%coefficients for the ONL plane
Point1.x=x0;
Point1.y=y_ONL_x0_z0;
Point1.z=z0;

Point2.x=x0;
Point2.y=y_ONL_x0_zMax;
Point2.z=zMax;

Point3.x=xMax;
Point3.y=y_ONL_xMax_zMax;
Point3.z=zMax;

%--------------------------------------------------------------------------
%               FUNCTION--DEFINE PLANE
%--------------------------------------------------------------------------

%* use function to determine coefficients for the ONL plane
ONL_PlaneStructure=func_DefinePlane(Point1,Point2,Point3);


%--------------------------------------------------------------------------
%               FUNCTION--COMPUTE DISTANCE
%--------------------------------------------------------------------------

%* use function to compute the distance of each nucleus to the ONL plane
ONL_NucleiDistancesFromPlane=func_FindDistanceFromPlane(ONL_PlaneStructure,List_NucleiCoords);



%==========================================================================
%     DISTANCE FROM OPL PLANE
%==========================================================================

%--------------------------------------------------------------------------
%               DEFINE TERMS USED BY FUNCTION
%--------------------------------------------------------------------------

%* define 3 coordinate points from the OPL in order to determine
%coefficients for the OPL plane
Point1.x=x0;
Point1.y=y_OPL_x0_z0;
Point1.z=z0;

Point2.x=x0;
Point2.y=y_OPL_x0_zMax;
Point2.z=zMax;

Point3.x=xMax;
Point3.y=y_OPL_xMax_zMax;
Point3.z=zMax;

%--------------------------------------------------------------------------
%               FUNCTION--DEFINE PLANE
%--------------------------------------------------------------------------

%* use function to determine coefficients for the OPL plane
OPL_PlaneStructure=func_DefinePlane(Point1,Point2,Point3);


%--------------------------------------------------------------------------
%               FUNCTION--COMPUTE DISTANCE
%--------------------------------------------------------------------------

%* use function to compute the distance of each nucleus to the OPL plane
OPL_NucleiDistancesFromPlane=func_FindDistanceFromPlane(OPL_PlaneStructure,List_NucleiCoords);









end












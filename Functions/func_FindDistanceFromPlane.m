%{
Name:
    func_FindDistanceFromPlane


Version:
    Wessler
    2022 May 17
    Public Version


Description:
    *Finds the distance from a 3d point to a plane in 3d space.
    *The equation of the plane is in the following format: Ax+By+Cz+D=0
    *The distance is the length of the segment perpendicular to the plane,
     connecting the point and the plane; i.e., it's the length of the
     projection of the point onto the plane
    *From vector algebra, the length of a projection is:
        (||(PointOffPlane - PointOnPlane) dot (NormalVector)||) / (||NormalVector||)
        =>
        (| A*(xOffPlane - xOnPlane) + B*(yOffPlane - yOnPlane) + C*(zOffPlane - zOnPlane) |) / sqrt(A^2+B^2+C^2)
        =>
        (| (A*xOffPlane+B*yOffPlane+C*zOffPlane) - (A*xOnPlane+B*yOnPlane+C*zOnPlane) |) / sqrt(A^2+B^2+C^2)
        =>
        (| (A*xOffPlane+B*yOffPlane+C*zOffPlane) - (A*xOnPlane+B*yOnPlane+C*zOnPlane+D)+D |) / sqrt(A^2+B^2+C^2)
        =>
        (| (A*xOffPlane+B*yOffPlane+C*zOffPlane) - (0)+D |) / sqrt(A^2+B^2+C^2)
        =>
        (| (A*xOffPlane+B*yOffPlane+C*zOffPlane) + D |) / sqrt(A^2+B^2+C^2)
    *NOTE: we want a signed distance, so omit the absolute value to
     indicate which side of the plane the point is on


Inputs:
    *PlaneTerms
    *PointsList

    PlaneTerms is a structure that contains all of the coefficients that
    define the equation of the plane (Ax+By+Cz+D=0).
    It is in the following format:
        PlaneTerms.A
        PlaneTerms.B
        PlaneTerms.C
        PlaneTerms.D

    PointsList is a matrix of numbers that define the coordinates of the 3d
    points. Each row defines a point. The first column are the x
    coordinates; the second column are the y coordinates; and the third
    column are the z coordinates.


Outputs:
    *DistanceOutput
    *This is a vector of numbers that define the distance between each
     point in the points list and the plane defined by the plane terms.
     Each "row" of the vector corresponds to the distance from the point in
     each row of PointsList from the plane defined by the terms in
     PlaneTerms.
        ex: DistanceOutput(1) is the distance from PointsList(1,:) to the plane


Used by:
    *func_ComputeDistances.m


Uses:
    NOTHING


NOTES:

%}


function DistanceOutput=func_FindDistanceFromPlane(PlaneTerms,PointsList)


A=PlaneTerms.A;
B=PlaneTerms.B;
C=PlaneTerms.C;
D=PlaneTerms.D;


xList=PointsList(:,1);
yList=PointsList(:,2);
zList=PointsList(:,3);



Numerator=(A*xList+B*yList+C*zList+D);
Denominator=sqrt(A*A+B*B+C*C);
MinDist=Numerator./Denominator;


DistanceOutput=MinDist;


end














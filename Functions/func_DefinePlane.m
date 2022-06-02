%{
Name:
    func_DefinePlane


Version:
    Wessler
    2022 May 17
    Public Version


Description:
    *Defines a plane by 3 3d coordinates.
    *The equation of the plane is the following: Ax+By+Cz+D=0
    *From vector algebra: a plane can be described by the vector normal to
     2 intersecting vectors (and vectors described by 2 points)


Inputs:
    *3 3d coordinates: Point1, Point2, Point3
    *These terms are structures with each having x-, y-, z-coordinates
        ex: Point1.x, Point1.y, Point1.z (all should be real numbers)


Outputs:
    *PlaneTerms
    *This term is a structure that has all of the coefficients of the equation of the plane:
        PlaneTermsOutput.A
        PlaneTermsOutput.B
        PlaneTermsOutput.C
        PlaneTermsOutput.D
        ...put together we can construct the equation Ax+By+Cz+D=0


Used by:
    *func_ComputeDistances.m


Uses:
    NOTHING


NOTES:

%}


function PlaneTermsOutput=func_DefinePlane(Point1,Point2,Point3)


x1=Point1.x;
y1=Point1.y;
z1=Point1.z;

x2=Point2.x;
y2=Point2.y;
z2=Point2.z;

x3=Point3.x;
y3=Point3.y;
z3=Point3.z;

%vector Point2-to-Point1
x_21=x2-x1;
y_21=y2-y1;
z_21=z2-z1;

%vector Point3-to-Point1
x_31=x3-x1;
y_31=y3-y1;
z_31=z3-z1;

%normal vector coefficients (same as equation of plane coefficients) obtained from cross product
A=y_21*z_31-y_31*z_21;
B=x_31*z_21-x_21*z_31;
C=x_21*y_31-y_21*x_31;

%plug in Point1 to get D
D=(-A*x1-B*y1-C*z1);



PlaneTermsOutput.A=A;
PlaneTermsOutput.B=B;
PlaneTermsOutput.C=C;
PlaneTermsOutput.D=D;


end










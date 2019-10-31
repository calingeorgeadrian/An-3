%lab 3

%A = [1 0 1; 0 1 2; 0 0 -6];
%b = [4;8;-18];
%x = SubsDesc(A,b);

A = [0 1 1;2 1 5; 4 2 1];
b = [3; 5; 1];
x = GaussFaraPiv(A,b); 
y = GaussCuPivPartiala(A,b);
z = GaussCuPivTotala(A,b);
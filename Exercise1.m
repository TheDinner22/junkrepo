function [name, ufid, ...
    A, rref_A, det_A, det_AT, ...
    A1, b1, sol_1_partic, sol_1_matlab, sol_1_cramer, ...
    A2, b2, sol_2_partic, sol_2_matlab, sol_2_cramer, ...
    A3, b3, sol_3_partic, sol_3_matlab, sol_3_cramer] = Exercise1()
    % --- Name & UFID --- %
    name = "";
    ufid = ;

    % --- Part A [10 Points] --- %
    % (i) Some MATLAB implementation details...

    % vvvvv COMMENT OUT BEFORE SUBMITTING vvvvv %
    %n = randi([2500, 5000]);
    %A = randi([-7,7], n, n);
    %b = randi([-7,7], n, n);

    %tic
    %    A\b;
    %toc;

    %tic
    %    inv(A) * b;
    %toc;
    % ^^^^^ COMMENT OUT BEFORE SUBMITTING ^^^^^ %
    % (COMPARE BOTH & NOTE WHICH ONE IS FASTER & FIND OUT WHAT A\b ACTUALLY DOES)
    % So A/b is almost twice as fast as inv(A)*b
    % A/b will give the solution to the equation Ax=b
    % inv(A)*b will only give the solution to Ax=b when A is invertable.
    % All over and under determined systems are non-invertable so
    % inv(A)*b won't work unless the matrix A happens to be invertable.
    % In general inv(A)*b only works if there is a unique solution
    % if the system is inconsistent or has infinately many solutions,
    % A/b works better than inv(A)*b.

    % (ii) Some more practical things...
    A = [1 2 3; -4 -5 -6; 7 8 9];
    rref_A = rref(A);

    % (CONCLUDE INVERTIBILITY OF A WITH VALID REASONING)
    % Therefore, the determinant of A is (ENTER HERE).
    % So the rref of a only has 2 pivot columns. That is rank(A)=2
    % but A has 3 rows and 3 cols. Since the rref of A is not the identity
    % matrix, A is not row equivalent to the identity matrix and thus
    % not invertable (by the invertable matrix thm)
    % Since a is not invertable, its determinant must be ZERO!
    % since A's last row is a zero row, you can calculate this trivially
    % using the cofactor expansion.

    det_A = det(A);
    % disp(det(sym(A))) % (COMMENT OUT BEFORE SUBMISSION!)

    det_AT = det(A');

    % (DETERMINE RELATION BETWEEN det(A) AND det(A^T))
    % (WHAT CAN YOU SAY ABOUT THE INVERIBILITY OF A^T WHEN A IS NOT INVERTIBLE?)
    % If A is not invertable then neither is A'. This is because invertable
    % matrixes must have a pivot in every row and every col.
    % If some nxn matrix, M, is missing a pivot col (rank(M)=n-1) that
    % implies that M' is missing a pivot in one of its rows 
    % (by definition of the transpose). Of course, this means that if
    % M is invertable, so is M'

    % --- Part B [10 Points] --- %
    A1 = [1 1 -2; 1 -2 4; 0 1 -2];
    b1 = [1; -2; 3];

    sol_1_partic = ParticularSolution(A1, b1);
    sol_1_matlab = A1\b1;
    sol_1_cramer = CramersRule3x3(A1, b1);

    % (IS THE SYSTEM CONSISTENT & PROVIDE REASONING)
    % (DETERMINE ALL SOLUTIONS OF THE SYSTEM)
    % the system is not consistent for any x
    % that is A1x != b1 for all x in R^3
    % ParticularSolution returns an empty array of solutions
    % (because there aren't any) this is because the rref of [A1|b1]
    % has a pivot in the last column
    % CramersRule3x3 returns NaN becuase A is close to singular 
    % (det(A1) = 0) so we cant apply cramers rule (cant divide by 0)

    % --- Part C [10 Points] --- %
    A2 = [1 1 -2; 1 -2 4; 0 1 -2];
    b2 = [1; -2; 1];

    sol_2_partic = ParticularSolution(A2, b2);
    sol_2_matlab = A2\b2; 
    sol_2_cramer = CramersRule3x3(A2, b2);

    % (IS THE SYSTEM CONSISTENT & PROVIDE REASONING)
    % (DETERMINE ALL SOLUTIONS OF THE SYSTEM)
    % So x3 is free in this system. The matrix a is not invertable
    % and so we cannot apply cramers rule (cant divide by 0)
    % since there are inf many solutions A2\b2 returns NaN,NaN,NaN
    % ParticularSolution returns x = [0; 1; 0]
    % in general the soltions have the form
    % x = [0; 1+2*x3; x3]
    % if you set x3=0, you get what ParticularSolution returns.

    % --- Part D [10 Points] --- %
    A3 = [1 1 -2; 1 -2 -2; 0 1 2];
    b3 = [1; -2; 1];

    sol_3_partic = ParticularSolution(A3, b3);
    sol_3_matlab = A3\b3; 
    sol_3_cramer = CramersRule3x3(A3, b3);

    % (IS THE SYSTEM CONSISTENT & PROVIDE REASONING)
    % (DETERMINE ALL SOLUTIONS OF THE SYSTEM)
    % the system is consistent and has a unique solution
    % A is invertable and thus has a non-zero determinant so we 
    % can apply cramers rule to find the unique solution
    % matlab and ParticularSolution also find the unique solution.
end


function [name, ufid, ...
    A1, b1, sol_1_partic, sol_1_matlab, sol_1_cramer, ...
    A2, b2, sol_2_partic, sol_2_matlab, sol_2_cramer, ...
    A3, b3, sol_3_partic, sol_3_matlab, sol_3_cramer] = Exercise2()
    % --- Name & UFID --- %
    name = "";
    ufid = ;

    % --- Part A (see CramersRule.m) [10 Points] --- %
    % DONE (I think)

    % --- Part B [10 Points] --- %
    % (i) m > n
    A1 = randi([-7,7], 5, 3);
    b1 = randi([-7,7], 5, 1);

    sol_1_partic = ParticularSolution(A1, b1);
    sol_1_matlab = A1\b1;
    sol_1_cramer = CramersRule(A1, b1);

    % (ii) m < n
    A2 = randi([-7,7], 3, 5);
    b2 = randi([-7,7], 3, 1);

    sol_2_partic = ParticularSolution(A2, b2);
    sol_2_matlab = A2\b2;
    sol_2_cramer = CramersRule(A2, b2);

    % (iii) m = n
    A3 = randi([-7,7], 5, 5);
    b3 = randi([-7,7], 5, 1);

    sol_3_partic = ParticularSolution(A3, b3);
    sol_3_matlab = A3\b3;
    sol_3_cramer = CramersRule(A3, b3);

    % --- Part C [10 Points] --- %

    % When A is invertible, (OBSERVATIONS)
    % all three methods return the unique solution
    % and of course, all three methods return the same thing
    % which makes sense because 
    % cramers rule works (A is invertable)
    % A\b works because there is only one solution to Ax=b
    % ParticularSolution works (it would also have worked if there were 
    % free variables)

    % When Ax = b is consistent where A is an n x n singular matrix,
    % (OBSERVATIONS)
    % if A is singular then cramers rule wont work since det(A) = 0
    % Since A is nxn, singular, and Ax=b is consistent, there must be
    % a free variable (one or more)
    % A\b won't work (just returns NaN's)
    % finally, ParticularSolution works
    % (so its the only method that works)
    % ParticularSolution is the only method that can handle free variables

    % When Ax = b is consistent where A is an m x n (non-square) matrix,
    % (OBSERVATIONS)
    % a is not square so cramers rule wont work (A is not invertable)
    % ParticularSolution wont work either (it is designed for nxn matrixes)
    % Assuming there are no free variables, A\b works and is the
    % only method that works
    % if A is mxn and has free variables, none of the three methods work
    % (we would need a ParticularSolution funciton that works on general
    % matrixes not just 3x3 matrixes)
end

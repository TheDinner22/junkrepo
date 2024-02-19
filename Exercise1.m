function [name, ufid, ...
    A1, A2, A3, dep_A1, dep_A2, dep_A3, ...
    B1, B2, B3, dep_B1, dep_B2, dep_B3, ...
    example_B, dep_B, example_C, dep_C] = Exercise1()
    % --- Name & UFID --- %
    name = "Joseph Handsome";
    ufid = ;

    % --- Part A [10 Points] --- %
    % (1) m < n
    A1 = randi([-7, 7], 3, 6);
    A2 = randi([-7, 7], 3, 6);
    A3 = randi([-7, 7], 3, 6);

    dep_A1 = dependence(A1);
    dep_A2 = dependence(A2);
    dep_A3 = dependence(A3);

    % (2) m > n
    B1 = randi([-7, 7], 6, 3);
    B2 = randi([-7, 7], 6, 3);
    B3 = randi([-7, 7], 6, 3);

    dep_B1 = dependence(B1);
    dep_B2 = dependence(B2);
    dep_B3 = dependence(B3);

    % --- Part B [10 Points] --- %
    % (OBSERVE & EXPLAIN)
    % the cols of a mxn matrix with m<n are always linearly dependent.
    % For the columns of a matrix to be linearly independent, Ax = 0 must
    % only have the trivial solution (that is, A must have a pivot in every
    % col); however, since m<n, there are more cols then there are rows.
    % Even if there were a pivot in every row (which is the max number
    % of pivots possible), there will never be a pivot in every col.

    example_B = NaN; % no examples :(
    dep_B = NaN;

    % --- Part C [10 Points] --- %
    % (OBSERVE & EXPLAIN)
    % the cols of a mxn matrix with m>n can be linearly dependent or
    % linearly independent. There are more rows than there are cols, so
    % it is possible (and likely) for there to be a pivot in every col.
    % However, it is possible to create a non-trivial mxn m>n matrix
    % whose cols are LD

    example_C = [1 -1 0; 0 0 10; 0 0 7; 0 0 99];
    dep_C = dependence(example_C);
end

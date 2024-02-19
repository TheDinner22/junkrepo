function [transform_type, name, ufid] = transformation(A)
    % Purpose: determine if T(x)=Ax is onto, one-to-one, both, or neither
    % Input Argument [A]: the standard matrix A of the linear
    % transformation T(x) = Ax
    % Output Argument [transform_type]: string indicating if T(x) is onto,
    % one-to-one, both, or neither

    % --- Name & UFID --- %
    name = "Joseph Handsome";
    ufid = ;

    [m, n] = size(A); % # of rows and columns of A, respectively

    both = "Onto and one-to-one";
    onto = "Onto but not one-to-one";
    one_to_one = "One-to-one but not onto";
    neither = "Neither onto nor one-to-one";

    rank_A = rank(A);
    % Use dependence.m as a guide to write this new function. Enter code below.

    % if rank(A) == n, then the cols form a linearly independent set
    % and this is an equivalent condition for being one-to-one

    % if rank(A) == m, then the cols span R^m
    % and this is an equivalent condition for being onto

    if rank_A == n && rank_A == m
        transform_type = both;
    elseif rank_A == n
        transform_type = one_to_one;
    elseif rank_A == m
        transform_type = onto;
    else
        transform_type = neither;
    end
end

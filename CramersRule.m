function [x, name, ufid]  = CramersRule(A, b)
    % Purpose: use cramers rule to find a particular
    % solution to Ax = b where A is nxn and invertable (has a non-zero 
    % determinant)
    % if a is not invertable, return NaN
    % Input Argument [A]: nxn coefficent matrix from Ax=b
    % Input Argument [b]: nx1 matrix from Ax=b
    % Output Argument [x]: solution to Ax=b, empty if no solution

    % --- Name & UFID --- %
    name = "";
    ufid = ;

    [m, n] = size(A); % # of rows and columns of A, respectively

    % Use CramersRule3x3.m as a guide to write this new function.
    % Hint: Use a for-loop.

    if m ~= n
        x = NaN;
    elseif abs(det(A)) <= 10^(-8) % Close to singular (so we can't apply Cramer's rule)
        x = NaN;
    else % Apply Cramer's Rule
        x = zeros(1, n); % Allocate the (row) vector in advance
        
        for i = 1:n
            B = A;
            B(:, i) = b; % A_i(b)
            x(i) = det(B) / det(A);
        end

        x = x'; % Transpose to express the solution as a column vector
    end    
end

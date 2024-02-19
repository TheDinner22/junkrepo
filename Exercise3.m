function [name, ufid, ...
    A1, A2, A3, A4, ...
    A, B, ABBA, C, AC, CA, AI, IA, inverse_A, ...
    D, inverse_D, rref_something, rref_inverse_D, inv_inv_D, ...
    E, inverse_DE, inv_D_inv_E, inv_E_inv_D, ...
    inv_DT, inv_D_T] = Exercise3(n)
    % --- Name & UFID --- %
    name = "Joseph Handsome";
    ufid = ;

    % --- Part A [10 Points] --- %
    % For-Loop (i)
    A1 = zeros(n);
    for i = 1:n
        for j = 1:n
            A1(i,j) = i + j;
        end
    end

    % For-Loop (ii)
    A2 = zeros(n);
    for i = 1:n
        for j = i:n
            A2(i,j) = i + j;
            A2(j,i) = A2(i,j);
        end
    end

    % (COMMENT; SAME OUTPUT?)
    % yeah the output is the same even though the
    % nested loops go from i:n and 1:n

    % For-Loop (i) = (EXPRESSION IN TERMS OF n) FLOPs
    % loop (i) will run n^2 (25 for n=5) times since both loops go from
    % 1:n
    % For-Loop (ii) = (EXPRESSION IN TERMS OF n) FLOPs
    % i know the time complexity is nlog(n)
    % but after (painfully) counting the number of additions
    % i got 15 additions

    % (COMPARE; WHICH REQUIRES LESS FLOPs?)
    % loop ii requires fewer FLOPs

    % --- Part B [10 Points] --- %
    % While-Loop (i)
    A3 = zeros(n); % (DO NOT MODIFY THIS LINE)

    % (REWRITE FOR-LOOP (i) USING WHILE LOOPS HERE)
    i=1;
    while i <= n
        j = 1;
        while j<=n
            A3(i,j) = i+j;
            j = j+1;
        end
        i = i+1;
    end

    % While-Loop (ii)
    A4 = zeros(n); % (DO NOT MODIFY THIS LINE)

    % (REWRITE FOR-LOOP (ii) USING WHILE LOOPS HERE)
    i=1;
    while i <= n
        j = i;
        while j<=n
            A4(i,j) = i+j;
            A4(j,i) = A4(i,j);
            j = j+1;
        end
        i = i+1;
    end

    % --- Part C [10 Points] --- %
    A = A1; % (DO NOT MODIFY THIS LINE)
    B = randi([-7, 7], n, n-2);

    ABBA = A*B;
    % (EXPLAIN WHY EITHER A*B OR B*A DOES NOT WORK / IS UNDEFINED)
    % matrix multiplication between A and B is only defined if
    % the number of cols in A is = to the number of rows in B
    % A is nxn and B is nx(n-2)
    % AB works becuase n=n 
    % BA crashes becuase n-2!=n

    C = randi([-7, 7], n, n);

    AC = A*C;
    CA = C*A;
    % (OBSERVE & EXPLAIN WHY EITHER EQUAL OR NOT EQUAL USING LINEAR ALGEBRA)
    % Aside: Matrix multiplication is function composition.
    % AC and CA are not equal
    % in general AB != BA
    % if you think back to the derivation of matrix multiplication
    % we consider A is mxn and B is nxp
    % we consider the composition of transformations from
    % R^p to R^n to R^m
    % performing the composition of transformation gives the definition
    % of matrix multiplication
    % reversing the composition
    % that is going from R^m to R^n to R^p (assuming the product is even
    % defined) will almost certainly give a different result since the
    % results are in R^m and R^p respectively

    AI = A*eye(n);
    IA = eye(n)*A;
    % (OBSERVE & EXPLAIN WHY EITHER EQUAL OR NOT EQUAL USING LINEAR ALGEBRA)
    % Hint: I_n, the identity matrix, has some special property.
    % since I_n is a diagonal matrix with all of its entries are equal to 1
    % IA = AI = A for any matrix A (as long as the product is defined

    % --- Part D [10 Points] --- %
    inverse_A = inv(A); %(dont like warning)
    % (OBSERVE WARNING & CONCLUDE INVERTIBILITY OF A)
    % A is not invertable! :(

    D = [1 0 -1; 2 1 -2; 0 1 -1];
    inverse_D = inv(D);

    % Complete using *only* two lines and using the rref function (cannot use
    % inv function)!
    rref_something = rref([D eye(3)]);
    rref_inverse_D = rref_something([1 2 3], [4 5 6]);

    inv_inv_D = inv(inverse_D);
    % (OBSERVE & GENERALIZE)
    % equals D, in general the inverse of a matrixes inverse is that matrix
    % that is the two inverses "cancel out"

    E = [1 -2 2; 1 -1 0; 1 -1 2];

    inverse_DE = inv(D*E);
    inv_D_inv_E = inv(D)*inv(E);
    inv_E_inv_D = inv(E)*inv(D);
    % The inverse of the product of two invertible matrices D and C is
    % equal to (FINISH GENERALIZATION)
    % the inverse of the product is equal to the product of the (reversed)
    % inverses, that is inv(DE) = inv(E)*inv(D)

    inv_DT = inv(D');
    inv_D_T = (inv(D))';
    % The inverse of the transpose of an invertible matrix D is equal to
    % (FINISH GENERALIZATION)
    % the transpose of the inverse
    % that is inv(D') = (inv(D))'
end

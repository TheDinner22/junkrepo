function [name, ufid, ...
    transform_A1, transform_A2, transform_A3, ...
    transform_B1, transform_B2, transform_B3, ...
    C1, C2, C3, transform_C1, transform_C2, transform_C3, ...
    example_neither, transform_neither] = Exercise2(A1, A2, A3, B1, B2, B3)
    % --- Name & UFID --- %
    name = "Joseph Handsome";
    ufid = ;

    % --- Part A (see transformation.m) [10 Points] --- %
    % done!

    % --- Part B [10 Points] --- %
    transform_A1 = transformation(A1);
    transform_A2 = transformation(A2);
    transform_A3 = transformation(A3);

    transform_B1 = transformation(B1);
    transform_B2 = transformation(B2);
    transform_B3 = transformation(B3);

    C1 = randi([-7, 7], 3, 3);
    C2 = randi([-7, 7], 3, 3);
    C3 = randi([-7, 7], 3, 3);

    transform_C1 = transformation(C1);
    transform_C2 = transformation(C2);
    transform_C3 = transformation(C3);

    % --- Part C [10 Points] --- %

    % (1) When m < n, a transformation T(x) = Ax (EXPLAIN USING MATHEMATICAL
    %     REASONING)
    % T(x) cannot be one-to-one because the cols of an mxn matrix with 
    % m<n cannot be linearly independent; the columns of the std matrix A
    % being linearly independent and T(x) being one-to-one are equivalent
    % conditions, so T(x) cannot be one-to-one because it cannot have
    % linearly independent cols.
    % If this reasoning isnt good enough (:p) then another reason is that
    % since there cant be a pivot in every col, Ax=0 can have more than
    % just the trivial solution. Furthermore, we can represent the solutions of
    % Ax=b as the solutions to Ax=0 shifted by some vector p. Since Ax=0
    % will have more than one solution so will Ax=b (since their solution
    % sets are the same, just shifted by a particular solution).

    % (2) When m > n, a transformation T(x) = Ax (EXPLAIN USING MATHEMATICAL
    %     REASONING)
    % when m>n T cannot be onto since we need a pivot in every row;
    % however, the max number of pivots is n which is less than m
    % so its impossible for A to have a pivot in every row, thus impossible
    % for T to be onto
    % if this not good enough (;p) then we can note that T is a
    % transformation from R^n to R^m and since the domain<codomain
    % it is impossible for the domain to be mapped onto the codomain
    % even if every input coresponded to a unique output (best case
    % scenario) T wouldn't be onto

    % (3) When m = n, a transformation T(x) = Ax (EXPLAIN USING MATHEMATICAL
    %     REASONING)
    % so for T to be neither one to one nor onto, we just need rank A !=n
    %(which implies rank(A) != m too). since m=n domain=codomain, however
    % this does not mean that domain=range. Certain x could make T(x)
    % inconsistent or one image could have several different preimages
    % 

    example_neither = [ 0 0 1; 0 0 8; 1 0 0];
    transform_neither = transformation(example_neither);

    % (4) When m = n, a transformation T(x) = Ax (EXPLAIN USING MATHEMATICAL
    %     REASONING)
    % if m=n and T is onto, then T must also be one-to-one. If there is a
    % pivot in every col there must also be a pivot in every row since n=m
    % that is, onto=>rank(A)=m but n=m so rank(A)=n as well
    % another way to think about it would be to note that, assuming T is
    % onto, domain=codomain=range. Since each pre-image can only correspond
    % to one unique image (even if a image can have several different
    % pre-images), claiming that T is somehow onto but not one-to-one
    % implies that domain>codomain, which we know is untrue becuase m=n

    % if m=n and T is one-to-one then a has a pivot in every col
    % thus rank(A)=n but since m=n that implies that rank(A)=m also
    % so T is also onto
end


function B = SMMatrixConverter(A)
%SMMatrixConverter Convert S matrix to M matrix and M matrix to S matrix
B = [A(1,1) * A(2,2) - A(2,1)* A(1,2), A(1,2); -A(2,1), 1] / A(2,2);
end


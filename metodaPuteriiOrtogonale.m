% X = matrice care are pe coloana i un vector propriu x_i
% l = vector care are pe pozitia i valoarea proprie lambda_i
function [X, l] = metodaPuteriiOrtogonale(A, tol, max_steps)
  X = [];
  l = [];
  n = length(A);
  
  for i=1:n
    prev_x = rand(n, 1);
    steps = 0;
    while 1
      for j = 1:size(X, 2)
        prev_x -= X(:, j)' * prev_x * X(:, j);
      endfor
      
      x = A * prev_x;
      x = x / norm(x);
      lambda = x' * A * x;
      err = norm(x - prev_x);
      if (++steps == max_steps) || (err < tol)
        l = [l, lambda];
        X = [X, x];
        break;
      endif
    endwhile
  endfor
endfunction
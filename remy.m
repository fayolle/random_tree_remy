% implement algorithm 7.2.1.6.R of Knuth's volume 4 on generating trees
% http://www.cs.utsa.edu/~wagner/knuth/fasc4a.pdf

L = randomBinTreeLink(10);
%disp(L);
T = linkToMatlabTree(L);
%disp(T);
treeplot(T');


function L = randomBinTreeLink(N)
%     Input:
%     N: number of internal nodes
% 
%     Output:
%     Linked representation L_0 L_1 ... L_{2N} of a uniformly 
%     random binary tree with N internal nodes

n = 0;
L = zeros(2*N+1,1);

while (n<N)
   X = randi([0,4*n+1]);
   n = n + 1;
   b = mod(X, 2);
   k = floor(X/2);
   tn = 2*n;
   L(tn-b+1) = tn;
   L(tn-1+b+1) = L(k+1);
   L(k+1) = tn-1;
end

end


function T = linkToMatlabTree(L)
% L(1) is the root
% if k is even, then it is a leaf
% otherwise, L(k+1) and L(k+2) are the two children
T = zeros(numel(L), 1);
T = linkToMatlabTreeRec(L(1), 1, L, T);
end


function T = linkToMatlabTreeRec(k, idx, L, T)
if mod(k, 2)==0
   % leaf
else
   % left subtree
   T(k+1) = idx;
   T = linkToMatlabTreeRec(L(k+1), k+1, L, T);
   % right subtree
   T(k+2) = idx;
   T = linkToMatlabTreeRec(L(k+2), k+2, L, T);
end
end


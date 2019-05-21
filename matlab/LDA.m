% to be completed
function ReturnVal = LDA (X, labels)

X = X'; %taking the transpose to fit the notations in the lecture notes

C = max(labels); %calculating the number of classes

M = zeros(size(X,2), size(X,2)); %creating a huge matrix M to store all the Ei

j = 1; %index of the matrix Ei

for i = 1:C 
    
    tempX = X(labels == i,:); %xi corresponding to the current class
    
    n = size(tempX,1); %number of elements corresponding to the given class
    
    E = ones(n, n) * 1/n; %building the matrix Ei
    
    M(j:j+n-1,j:j+n-1) = E; %putting the matrix Ei in the huge matrix M
    
    j = j+n; %calculating the index of the position of the next matrix E_i+1
end

MI = eye(size(M)) - M; %defining "MI" to simplify further equation

dim = size(M,1) - (C+1); %defining "dim" to simplify further equation

[V,D] = eigs(MI*X'*X*MI, dim); %taking the eigenvectors and eigenvalues of the matrix of lower dimensions

U = X*MI*V*D^(-1); %building the eigenvectors of the matrix of greater dimensions

Xb = U'*X*M; %making the projection

Q =  PCA(Xb',C-1); %computing PCA on the projected matrix

W = U*Q; %compute the final projection matrix

ReturnVal = W;
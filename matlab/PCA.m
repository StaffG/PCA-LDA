function ReturnVal = PCA(X, dim)
 
X = X';  %taking the transpose to fit the notations in the lecture notes
 
[n, m] = size(X); %getting the number of lines and columns
 
X = X*(eye(m)-1/(n*m)*ones(m,1)*transpose(ones(m,1))); %subtract the mean to the data
 
[V,D] = eig(X'*X); %finding the eigenvectors V and eigenvalues D of the matrix of lower dimensions
 
[~,ind] = sort(diag(D), 'descend'); % sorting the eigenvalues by putting the greater ones at the beginning
 
Ds = D(ind,ind); % reordering the eigenvalue
 
Vs = V(:,ind); % reordering the eigenvectors
 
U = X*Vs*Ds^(-0.5); %building the eigenvectors of the matrix of greater dimensions
 
Ud = U(:,1:dim); % choosing a chosen number of "dim" vectors
 
ReturnVal = Ud;
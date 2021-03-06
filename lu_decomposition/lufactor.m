function [L, U, P] = lufactor(A)
% luFactor(A)
%	LU decomposition with pivotiing
% inputs:
%	A = coefficient matrix
% outputs:
%	L = lower triangular matrix
%	U = upper triangular matrix
%   P = the permutation matrix




%% Error Handling


[r,c] = size(A); %establish r and c for rest of script

if r ~= c
    error('Matrix is not square')
end


%% Prep Matrices

onediag = [0];   % generates a ones vector length A for diag function
    for i = 1:length(A)
        onediag(i) = 1;
    end
P = diag(onediag); % creates 1 main diagonal matrix for Pivoting
L = diag(onediag); % greates 1 main diagonal starting matrix for L

U = A;



%% Iteracte for column count and redux and pivot

for ci = 1:c-1 %repeat process for all but last column
    fprintf('------ Pivot %d -----\n', ci)
    pivot(ci)
    fprintf('------ Redux %d -----\n', ci)
    redux(ci)
end

% disp("------ pivot 1 ------")
% pivot(1)
% pivot(2)
% pivot(3)


%% Sanity Checks
fprintf('----- Sanity Checks ----- \n')
disp("P*A")
P*A


disp("L*U")
L*U

P

%% end of script, functions below

 %% Nested Functions for use multiple times in script
    function pivot(cd)
        % U is the matrix to be worked on
        % P is the matrix to track pivots
        % cd is the column number (depth) to pivot at
        % hloc is the high lock (depth row height)
        
        % NEEDS:  hloc dynamic, cd automatic
        
        hloc = cd;
        
        for hloc = cd:r-1
                       
            [v, loc] = max(abs(U( hloc:r ,cd)));
            
            loc = loc + (hloc-1); %this corrects loc being the r# of the partial eval matrix
            
            %switch rows in U
            hrow = U(loc,:); %high row values
            srow = U(hloc,:); %switch row values
            U(hloc,:) = hrow;
            U(loc,:) = srow;
            
            %switch rows in P
            hprow = P(loc,:);
            sprow = P(hloc,:);
            P(hloc,:) = hprow;
            P(loc,:) = sprow;
            
            if cd >= 2
                %pivot rows in L up to current column depth cd
                hlrow = L(loc,1:cd -1);
                slrow = L(hloc,1:cd -1);
                L(hloc,1:cd -1) = hlrow;
                L(loc,1:cd -1) = slrow;
            end
            
            
        end
        
        U
        

        
    
    end


    function redux(cd)
        %cd = column number
        % U = working matrix
        fac = zeros(1,r);
        for ri = cd+1:r  %from row = column number +1 to bottom row
            fac(ri) = U(ri,cd)/U(cd,cd); %generate the factors for that column
            nrow = U(ri,:) - fac(ri).*U(cd,:); %calculate new mod row ri
            U(ri,:) = nrow; %sub in new mod row ri
            
            
            %store factors in L matrix
            L(ri,cd) = fac(ri);
            
           
            
        end
        
        U
        L
        
    end
 
 
 

 
end



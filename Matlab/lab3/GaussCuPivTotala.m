%lab3

function [x] = GaussCuPivTotala (A,b)
    A = [A b]; % matricea extinsa
    n = length(b);
    
    for k = 1: +1: n-1
        
        M = A(k:n, k:n);
        valmax = max(M(:));
        [p m] = find(M == valmax);
        
        if isempty(p)
            fprintf('Sist. incomp. sau sist. comp. nedet.'); 
            return;
        else
            p=p+k-1;
        end
         
        if p ~= k
            A([p k],:) = A([k p],:); % interschimba liniile p si k
        end
        
        index = 1:n
        if m ~= k
            A(:,[m k]) = A(:,[k m]); % interschimba col m si k
            index([m k]) = index ([k m]);
        end
        
        for l = k+1: +1: n
            A(l,:) = A(l,:) - A(l,k)/A(k,k) * A(k,:);
        end
         
        if A(n,n) == 0 
            fprintf('Sist. incomp. sau sist. comp. nedet.'); 
            return;
        end
        
    end
    x = SubsDesc(A(:,1:n),A(:,n+1));
end
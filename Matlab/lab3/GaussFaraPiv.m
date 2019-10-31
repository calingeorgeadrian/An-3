%lab3

function [x] = GaussFaraPiv (A,b)
    A = [A b]; % matricea extinsa
    n = length(b);
    
    for k = 1: +1: n-1
        
        p = find (A(k:n,k),1,'first'); % cauta elem nenule (unde,cate,care)
        
        if isempty(p)
            fprintf('Sist. incomp. sau sist. comp. nedet.'); 
            return;
        else
            p=p+k-1;
        end
         
        if p ~= k
            A([p k],:) = A([k p],:); % interschimba liniile p si k
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
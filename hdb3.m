Sn = [1 1 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1];
n = length(Sn) ;
codeSn = Sn;
count = 0; 

for i = 1:n
    if(codeSn(i) == 1)
        count = 0; 
    else
        count = count + 1;
        
        if count == 4  
            codeSn(i) = 2;
            codeSn(i-3) = 3;
            count = 0; 
        end
    end
end
flagB = 1;
count_1 = 0;
pV = 0;
pB = 0;

for i = 1:n %last bit -ve
    if (codeSn(i) == 3) && (flagB == 1) 
        codeSn(i) = 0;
        flagB = 0;
    end
    
    if codeSn(i) == 2 
        pV = i;
    else if codeSn(i) == 3 
            pB = i;
        end
    end
    
    if(pB > pV)
        for j = pV+1 : pB-1   
            count_1 = count_1 + codeSn(j); 
        end
        
        if mod(count_1 , 2) == 1 
            codeSn(pB) = 0;
        else
            codeSn(pB) = 1; 
        end
         pV = 0;
        pB = 0;
        count_1 = 0;
    end
end

even = 0;
evenV = 0;

for i = 1:n
    if codeSn(i) == 1
        codeSn(i) = -1; %last nonzero -ve then 1, +ve then -1
         break;
    end
end

for i = 1:n
    if codeSn(i) == 1
        if even == 0
            codeSn(i) = 1;
        else
            codeSn(i) = -1;
        end
        even = ~even;
    else if codeSn(i) == 2
        evenV = even; 
        if evenV == 0
                codeSn(i) = -1;
            else
                codeSn(i) = 1;
            end
            evenV = ~evenV;
        end
    end
end
    
figure(1);
subplot(2,1,1);
stairs(0:length(Sn)-1,Sn);
axis([0 length(Sn) -2 2]);
title('main signal'); grid;

subplot(2,1,2);
stairs(0:length(codeSn)-1,codeSn);
axis([0 length(codeSn) -2 2]);
title('hdb3'); 
grid; 
    

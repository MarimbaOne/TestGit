%% initFile

% This script initializes a random vector with changing number of entries 
% with integers between 1 to 15 and sorts them first automatically, second 
% manually and compares computational times


%% Initialize vector
num = 10;
range = 15;
vec = round(rand(num,1)*(range-1)+1);

% Show distribution
if 0
amount=zeros(1,15);
for i = 1:range
    amount(i)=length(find(vec==i));     % find all entries equal to number and count the entries
end
plot(amount)
grid 
xlim([1 15])
end

tic
sort1=sort(vec);
t1=toc;

tic
sort2 = vec;
for i=2:num
    k=i;
    while sort2(k)<sort2(k-1)
        sort2(k-1:k) = [sort2(k);sort2(k-1)];
        if k>2
        k=k-1;
        end
    end
end
t2=toc;


ratio=t2/t1;
disp(['The evaluation time for automatic sort was: ' num2str(t1)])
disp(['The evaluation time for manual sort was: ' num2str(t2)])
disp(['Therefore the automatic search was faster by the factor of: ' num2str(ratio)])
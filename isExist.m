function [flag] = isExist(val, array)%Check whether a value is existing.
n = size(array, 2);
flag = 0;
for i = 1:n
    if val == array(i)
        flag = 1;
        break;
    end;
end;
    
pos = 1000;

while pos > 0
    p = imread(sprintf('%s%d%s', '.\pic\peppers', pos, '.bmp'));
    sum = checksum(p);
%     sum = mod( sum, 256) / 256;%THE VALUE OF SUM MAY BE ZERO HERE !!!
    sum
    if sum == 0.19910504
        pause;
    end;
    pos = pos - 1;
end;
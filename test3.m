hpos = zeros(1, 1000);
vpos = zeros(1, 1000);

for i = 1 : 1000       
    hpos(i) = ceil(unifrnd(0, 1, 1) * 256);
    vpos(i) = ceil(unifrnd(0, 1, 1) * 256);
end;

done = 1;
done
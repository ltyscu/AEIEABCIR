
%%%----DO NOT USE RAND() FUNCTION !---%%%
flag = zeros(256, 256);

i = 1000;

while i > 0
    tag = 1;
    [p, cmap] = imread('brain.bmp');
    p = double(p);
    while tag == 1
        hpos = ceil(unifrnd(0, 1, 1) * 256);
        vpos = ceil(unifrnd(0, 1, 1) * 256);
        hpos
        vpos
        if flag(hpos, vpos) == 1
            tag = 1;
        else
            tag = 0;
%             temp = p(hpos, vpos);
%             val = round( unifrnd(1, 100, 1));
%             val
%             p(hpos, vpos) = mod( p(hpos, vpos) + val, 256);
%             if temp == p(hpos, vpos)
%                 p(hpos, vpos) = p(hpos, vpos) + 1;
%             end;
            if p(hpos, vpos) == 255
                p(hpos, vpos) = p(hpos, vpos) - 1;
                flag(hpos, vpos) = 1;
            else
                p(hpos, vpos) = p(hpos, vpos) + 1;
                flag(hpos, vpos) = 1;
            end;
        end;
    end;
    p = uint8(p);
%     for j = 1:256*256
%         if p(j) > 255
%             dispaly('Exceed !');
%             pause;
%         end;
%     end;
    imwrite(p, sprintf('%s%d%s', '.\pic\brain\p\brain', i, '.bmp'), 'bmp');
    i = i - 1;
end;
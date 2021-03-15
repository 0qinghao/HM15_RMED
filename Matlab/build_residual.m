function residual_pic = build_residual(filename,fully,fullx)
    zmat = gen_zorder_mat;
    residual_pic = nan(fullx,fully);
    f = fopen(filename,'r');

    while ~feof(f)
        tline = fgetl(f);
        cusize = regexp(tline, '(?<=尺寸)\d*', 'match');
        if ~isempty(cusize)
            tline = fgetl(f);
            ctuy = regexp(tline, '(?<=当前CTU位置)\d*', 'match');
            ctux = regexp(tline, '(?<=当前CTU位置\d*\s)\d*', 'match');
            tline = fgetl(f);
            zorder = regexp(tline, '(?<=Z顺序)\d*', 'match');
            tline = fgetl(f);
            residual = regexp(tline, '[\-0-9]*', 'match');

            cusize = str2num(char(cusize));
            ctuy = str2num(char(ctuy));
            ctux = str2num(char(ctux));
            zorder = str2num(char(zorder));
            residual = reshape(str2num(char(residual)),cusize,cusize)';

            [raster_x,raster_y] = find(zmat==zorder);
            map_pos_x = ctux + ( raster_x-1 )*4 + 1;
            map_pos_y = ctuy + ( raster_y-1 )*4 + 1;
            residual_pic(map_pos_x:map_pos_x+cusize-1,map_pos_y:map_pos_y+cusize-1) = residual;

        end
    end

    offset = abs(min(min(residual_pic)));
    imshow(uint8((residual_pic+offset)));
end
function residual_pic = build_residual(filename)
    zmat = gen_zorder_mat;
    f = fopen(filename, 'r');

    while ~feof(f)
        tline = fgetl(f);
        processflag = regexp(tline, '(?<=残差处理)[0-1]{1}', 'match');
        if ~isempty(processflag)
            tline = fgetl(f);
            cusize = regexp(tline, '(?<=尺寸)\d*', 'match');
            tline = fgetl(f);
            ctuy = regexp(tline, '(?<=当前CTU位置)\d*', 'match');
            ctux = regexp(tline, '(?<=当前CTU位置\d*\s)\d*', 'match');
            tline = fgetl(f);
            zorder = regexp(tline, '(?<=Z顺序)\d*', 'match');
            tline = fgetl(f);
            residual = regexp(tline, '[\-0-9]*', 'match');

            processflag = str2num(char(processflag));
            cusize = str2num(char(cusize));
            ctuy = str2num(char(ctuy));
            ctux = str2num(char(ctux));
            zorder = str2num(char(zorder));
            residual = reshape(str2num(char(residual)), cusize, cusize)';

            [raster_x, raster_y] = find(zmat == zorder);
            map_pos_x = ctux + (raster_x - 1) * 4 + 1;
            map_pos_y = ctuy + (raster_y - 1) * 4 + 1;

            if (processflag == 1)
                residual_pic_process(map_pos_x:map_pos_x + cusize - 1, map_pos_y:map_pos_y + cusize - 1) = residual;
            else
                residual_pic_noprocess(map_pos_x:map_pos_x + cusize - 1, map_pos_y:map_pos_y + cusize - 1) = residual;
            end
        end
    end
    fclose(f);
    
    show_no_process = uint8((residual_pic_noprocess+255)/2);
    show_no_process = show_no_process + (255 - (max(max(show_no_process))));
    show_process = uint8((residual_pic_process+255)/2);
    show_process = show_process + (255 - (max(max(show_process))));
    % offset = abs(min(min(residual_pic_process, residual_pic_noprocess)));
    
    p = figure;
%     set(p,'visible','off');
    subplot(1,2,1)
    imshow(show_no_process);
    title('未经处理的残差可视图')
    subplot(1,2,2)
    imshow(show_process);
    title('经过处理的残差可视图')
    
    savefig(p, strcat(filename,'.fig'), 'compact')
end

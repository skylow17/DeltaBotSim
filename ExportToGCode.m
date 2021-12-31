function ExportToGCode(Travel, offset, filename, filepath)

%basic GCode infos
GCode(1,1) = sprintf("G21 G90 F%.3f ; Metric values, absolute pos, feedrate", offset(1,4)); % metric, absolute, feedrate

%write all the GCode absolute coordinate into single row string matrix
for index = 1:1:(length(Travel))
GCode(index + 1,:) = sprintf("\nG1 X%.3f Y%.3f Z%.3f", ...
    Travel(index, 1) + offset(1,1), ...
    Travel(index, 2) + offset(1,2), ...
    Travel(index, 3) + offset(1,3)); 
end

%%save to file

%get file id
file_id = fopen(sprintf("%s%s", filepath, filename), 'w');

%write to file and close it
fprintf(file_id, "%s", GCode(:,1));
fclose(file_id);
end

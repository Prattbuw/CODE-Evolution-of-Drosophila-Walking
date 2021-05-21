clear all 

fileList = dir('*.mp4');

tic
for i = 1:length(fileList)
    ref_v = VideoReader(fileList(i).name);
    fileList.name 
    
    if ref_v.Duration < 60
        fileList(i).nameVi
        
        for ii = 1:ref_v.Duration*ref_v.FrameRate
            invert = imcomplement(rgb2gray(read(ref_v,ii)));
            nohaze_invert = imreducehaze(invert, 'Method', 'approxdcp', 'ContrastEnhancement', 'boost');
            nohaze_invert_complement(:,:,:,ii) = imcomplement(nohaze_invert);
        end
        
        writerObj = VideoWriter(fileList(i).name);        
        writerObj.FrameRate = 150;   
        writerObj.Quality = 95
        open(writerObj);        
        writeVideo(writerObj, nohaze_invert_complement);        
        close(writerObj);
 
    elseif ref_v.Duration >= 60 
        fileList(i).name 
        ref_v.Duration 
     
     %iterate through different parts of the video 
     
     num_min = floor((ref_v.Duration * ref_v.FrameRate)/7440)
     
     if num_min == 1 
         frame_intervals = [1 7440 floor(ref_v.Duration*ref_v.FrameRate)]; 
         
     elseif num_min == 2  
         %frame_intervals = [1 7440]; 
         frame_intervals = [1 7440 7440*2 floor(ref_v.Duration*ref_v.FrameRate)]; 
         %frame_intervals = [1 100 1000]; 
     elseif num_min == 3 
         frame_intervals = [1 7440 7440*2 7440*3 floor(ref_v.Duration*ref_v.FrameRate)]; 
         
     elseif num_min == 4 
         frame_intervals = [1 7440 7440*2 7440*3 7440*4 floor(ref_v.Duration*ref_v.FrameRate)];
         
     elseif num_min == 5 
         frame_intervals = [1 7440 7440*2 7440*3 7440*4 7440*5 floor(ref_v.Duration*ref_v.FrameRate)];
         
     elseif num_min == 6 
         frame_intervals = [1 7440 7440*2 7440*3 7440*4 7440*5 7440*6 floor(ref_v.Duration*ref_v.FrameRate)];
         
     elseif num_min == 7
         frame_intervals = [1 7440 7440*2 7440*3 7440*4 7440*5 7440*6 7440*7 floor(ref_v.Duration*ref_v.FrameRate)];
         
     elseif num_min == 8
         frame_intervals = [1 7440 7440*2 7440*3 7440*4 7440*5 7440*6 7440*7 7440*8 floor(ref_v.Duration*ref_v.FrameRate)];
         
     elseif num_min == 9
         frame_intervals = [1 7440 7440*2 7440*3 7440*4 7440*5 7440*6 7440*7 7440*8 7440*9 floor(ref_v.Duration*ref_v.FrameRate)];
         
     elseif num_min == 10
         frame_intervals = [1 7440 7440*2 7440*3 7440*4 7440*5 7440*6 7440*7 7440*8 7440*9 floor(ref_v.Duration*ref_v.FrameRate)];
         
     end
     
     n = 1;
     for ii = 1:length(frame_intervals)-1
         video_frames = read(ref_v, [frame_intervals(ii) frame_intervals(ii+1)]); 
         for sub_frames = 1:size(video_frames,4) 
             gray_frames = rgb2gray(video_frames(:,:,:,sub_frames)); 
             invert = imcomplement(gray_frames); 
             nohaze_invert = imreducehaze(invert, 'Method', 'approxdcp', 'ContrastEnhancement', 'boost');
             nohaze_invert_complement(:,:,:,sub_frames) = imcomplement(nohaze_invert);
         end
         
         save_name = sprintf('%s %d %s', fileList(i).name,n, '.avi');
         writerObj = VideoWriter(save_name);
         writerObj.FrameRate = 150;
         writerObj.Quality = 95; 
         open(writerObj);
         writeVideo(writerObj, nohaze_invert_complement);
         close(writerObj);
         n = n+1;
         
          end 
    end 
    
end 
 
 toc

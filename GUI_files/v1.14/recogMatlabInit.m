function done= recogMatlabInit()
        load trained_net_3_26_aug.mat;
        load trained_net_94_percent_val_1_sec_supta_words_working.mat;
        fs = 16000 ; 
        nBits = 8 ; 
        nChannels = 1 ; 
        % ID = -1; % default audio input device 
        recObj = audiorecorder(fs,nBits,nChannels, -1);
        fprintf('Initiated recognizer')
        recordblocking(recObj,0.1);
        audioTrack = getaudiodata(recObj);
        done = 1;
end
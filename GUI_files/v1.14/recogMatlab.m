function recogText= recogMatlab(event)
%         load trained_net_3_26_aug.mat;
        if strcmp(event, '-sentence-')
            load trained_sentence_onlyShuvo_30Sample.mat;
            segmentDuration = 2;

        elseif strcmp(event, '-word-')
            load trained_net_93_percent_val_1_sec_supta_words_with_dhonnobad_2.mat;
            segmentDuration = 1;
        elseif strcmp(event, '-number-')
            load trained_digits_bigDataset.mat;
            segmentDuration = 1;
        else
            load trained_net_1.mat
            segmentDuration = 2;
        end
        fs =16000;
        frameDuration = 0.025;
        hopDuration = 0.010;
        
        segmentSamples = round(segmentDuration*fs);
        frameSamples = round(frameDuration*fs);
        hopSamples = round(hopDuration*fs);
        overlapSamples = frameSamples - hopSamples;
        
        FFTLength = 512;
        numBands = 50;

        afe = audioFeatureExtractor( ...
            SampleRate=fs, ...
            FFTLength=FFTLength, ...
            Window=hann(frameSamples,"periodic"), ...
            OverlapLength=overlapSamples, ...
            barkSpectrum=true);
        setExtractorParameters(afe,"barkSpectrum",NumBands=numBands,WindowNormalization=false);
        nBits = 8 ; 
        nChannels = 1 ; 
        % ID = -1; % default audio input device 
        
        recObj = audiorecorder(fs,nBits,nChannels, -1);
        fprintf('Starting to record')
        recordblocking(recObj,segmentDuration);
        audioTrack = getaudiodata(recObj);
        if strcmp(event, '-number-')
            duration = 0.512;
            voiceIndex = detectSpeech(audioTrack, fs);
            onlyVoice = audioTrack(voiceIndex(1):voiceIndex(1)+duration*fs-1);
            rescaled = rescale(onlyVoice, -0.8,0.8);
            audioTrack =  rescaled-sign(mean(rescaled))*mean(rescaled);
        end
        
%         auditorySpect = helperExtractAuditoryFeatures(audioTrack,fs);
%         auditorySpect = log10(auditorySpect + 1e-6);
        auditorySpect = extract(afe, audioTrack);
        auditorySpect = log10(auditorySpect + 1e-6);
        command = classify(trainedNet,auditorySpect);
        
        recogText = string(command);
end
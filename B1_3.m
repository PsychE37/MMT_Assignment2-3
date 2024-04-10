samplesDir = './samples';
musicFiles = {'dream_theater.mp3', 'michael_jackson.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

% Loop through each music file to perform tempo analysis
for i = 1:length(musicFiles)

    filePath = fullfile(samplesDir, musicFiles{i});
    audio = miraudio(filePath);
    
    tempo = mirtempo(audio, 'Frame', 2);
    tempoTimeSeries = get(tempo, 'Data');
    tempoValues = mirgetdata(tempo);
    minTempo = min(tempoValues);
    maxTempo = max(tempoValues);
    
    fprintf('Music File: %s\n', musicFiles{i});
    fprintf('Range of Tempo Variation: %.2f BPM to %.2f BPM\n\n', minTempo, maxTempo);
end

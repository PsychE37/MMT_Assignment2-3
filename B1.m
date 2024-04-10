samplesDir = './samples';

% List of music files to analyze
musicFiles = {'dream_theater.mp3', 'michael_jackson.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swift.mp3'};

% Loop through each music file to perform tempo estimation
for i = 1:length(musicFiles)
    % Construct the full path to the current audio file
    filePath = fullfile(samplesDir, musicFiles{i});
    
    % Read the audio file using miraudio
    audio = miraudio(filePath);
    
    % Estimate the tempo of the audio file
    tempo = mirtempo(audio);
    
    % Display the estimated tempo
    fprintf('Estimated tempo for %s: ', musicFiles{i});
    mirgetdata(tempo)
    
    % Play the audio excerpt - Uncomment the line below to play each file.
    % Note: Listening and adjusting a metronome based on this is a manual process.
    mirplay(audio);
    
    % After listening and using an online metronome to match the tempo,
    % document the matched tempo and the range of tempo within the excerpt if it varies.
end
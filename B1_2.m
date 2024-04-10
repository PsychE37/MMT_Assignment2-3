samplesDir = './samples';
musicFiles = {'dream_theater.mp3', 'michael_jackson.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

perceptualTempo = [180,100,140,110,60];


for i = 1:length(musicFiles)

    filePath = fullfile(samplesDir, musicFiles{i});
    audio = miraudio(filePath);
    
    tempo = mirtempo(audio);
    estimatedTempo = mirgetdata(tempo);
    
    perceptual = perceptualTempo(i);
    fprintf('Music File: %s\n', musicFiles{i});
    fprintf('Computational Estimate: %.2f BPM\n', estimatedTempo);
    fprintf('Perceptual Estimate: %.2f BPM\n', perceptual);
    discrepancy = abs(estimatedTempo - perceptual);
    fprintf('Discrepancy: %.2f BPM\n\n', discrepancy);
end

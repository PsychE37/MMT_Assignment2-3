% Define frame lengths and overlap percentages
frame_lengths = [0.2, 0.4, 0.6];
overlap_percentages = [0.5, 0.75];  % Example overlap percentages

% Calculate hop factors
hop_factors = 1 - overlap_percentages;

% Load audio file
x = miraudio('data/06.wav');

% Iterate over frame lengths
for fl = 1:length(frame_lengths)
    frame_length = frame_lengths(fl);
    
    % Iterate over hop factors
    for hf = 1:length(hop_factors)
        hop_factor = hop_factors(hf);
        
        % Calculate hop size based on frame length and hop factor
        hop_size = frame_length * hop_factor;
        
        % Compute chromagram with adjusted frame length and hop size
        feature = mirchromagram(x, 'Frame', frame_length, 's', hop_size);
        
        % Get chroma data
        chroma_data = mirgetdata(feature);
        
        % Compute similarity matrix
        similarity_matrix = mirsimatrix(chroma_data);
        similarity_data = mirgetdata(similarity_matrix);
        
        % Plot similarity matrix
        figure;
        imagesc(similarity_data);
        xlabel('Frame');
        ylabel('Frame');
        title(['Similarity Matrix - Frame Length: ', num2str(frame_length), ', Hop Factor: ', num2str(hop_factor)]);
        colorbar;
    end
end

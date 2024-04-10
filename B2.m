features = {'chroma', 'mfcc', 'spectrum'};
frame_lengths = [0.2, 0.4,0.6];

for feat = 1:length(features)
    for fl = 1:length(frame_lengths)
				x = miraudio('data/06.wav');
				if strcmp(features{feat}, 'chroma')
						feature = mirchromagram(x, 'Frame', frame_lengths(fl));
				elseif strcmp(features{feat}, 'mfcc')
						feature = mirmfcc(x, 'Frame', frame_lengths(fl));
				elseif strcmp(features{feat}, 'spectrum')
						feature = mirspectrum(x, 'Frame', frame_lengths(fl));
				end
				
				chroma_data = mirgetdata(feature);
				similarity_matrix = mirsimatrix(chroma_data);
				similarity_data = mirgetdata(similarity_matrix);
				figure;
				imagesc(similarity_data);
				xlabel('Frame');
				ylabel('Frame');
				title(['Similarity Matrix - Feature: ', features{feat}, ', Frame Length: ', num2str(frame_lengths(fl))]);
				colorbar;

    end
end
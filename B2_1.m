samplesDir = 'samples';
musicFiles = {'dream_theater.mp3', 'michael_jackson.mp3', 'mozart.mp3', 'queen.mp3', 'taylor_swft.mp3'};

for i = 1:length(musicFiles)
		x = miraudio(fullfile(samplesDir, musicFiles{i}));
		feature = mirchromagram(x, 'Frame', 0.6);		
		chroma_data = mirgetdata(feature);
		similarity_matrix = mirsimatrix(chroma_data);
		similarity_data = mirgetdata(similarity_matrix);
		figure;
		imagesc(similarity_data);
		xlabel('Frame');
		ylabel('Frame');
		title(['Similarity Matrix for ', musicFiles{i}]);
		colorbar;
end
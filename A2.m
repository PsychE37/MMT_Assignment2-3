fs = 44100;
duration = 0.3;
t = 0:1/fs:duration-1/fs;
notes = [ 293.5 329.5 392 392 392 392 392 392 392 293.5 329.5 392 392 392 392 392 392 392 293.5 329.5 392 392 392 392 392 392 392 293.5 329.5 392 ];

generateTone = @(note, harmonics) sum(sin(2 * pi * note .* t' * harmonics) ./ harmonics, 2);

melodyAll = [];
melodyNoFundamental = [];
melodyNoFundamentalAndSecond = [];	

for note = song
    melodyAll = [melodyAll; generateTone(note, 1:10)];
    melodyNoFundamental = [melodyNoFundamental; generateTone(note, 2:10)];
    melodyNoFundamentalAndSecond = [melodyNoFundamentalAndSecond; generateTone(note, 3:10)];
end

sound(melodyAll, fs);
pause(10);
sound(melodyNoFundamental, fs);
pause(10);
sound(melodyNoFundamentalAndSecond, fs);

% Save the melodies
audiowrite('melodyAll.wav', melodyAll, fs);
audiowrite('melodyNoFundamental.wav', melodyNoFundamental, fs);
audiowrite('melodyNoFundamentalAndSecond.wav', melodyNoFundamentalAndSecond, fs);
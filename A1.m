fs = 44100;
duration = 0.3;
t = 0:1/fs:duration-1/fs;
song = [ 293.5 329.5 392 392 392 392 392 392 392 293.5 329.5 392 392 392 392 392 392 392 293.5 329.5 392 392 392 392 392 392 392 293.5 329.5 392 ];

generateToneWithHarmonics = @(note, harmonics) sum(sin(2 * pi * note .* t' * harmonics) ./ harmonics, 2);

melodyAll = [];
melodyOdd = [];
melodyEven = [];
for note = song
    melodyAll = [melodyAll; generateToneWithHarmonics(note, 1:10)];
    melodyOdd = [melodyOdd; generateToneWithHarmonics(note, [3, 5, 7])];
    melodyEven = [melodyEven; generateToneWithHarmonics(note, [2, 4, 6])];
end

sound(melodyAll, fs);
pause(10);
sound(melodyOdd, fs);
pause(10);
sound(melodyEven, fs);

audiowrite('melodyAll.wav', melodyAll, fs);
audiowrite('melodyOdd.wav', melodyOdd, fs);
audiowrite('melodyEven.wav', melodyEven, fs);
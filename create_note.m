function note = create_note(instrument,pitch,duration,frequency)
% note = create_note(instrument,pitch,duration,frequency)


harms = length(instrument);

if pitch > 0    
    filter = note_filter(duration,frequency,300);
    bad_note = instrument * cos([1:harms]'*2*pi*pitch*[0:1/frequency:duration-1/frequency]);
    note = filter .* bad_note;
else
    note = zeros(1,duration*frequency);
end
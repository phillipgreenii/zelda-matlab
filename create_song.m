function out_song = create_song(song,instrument,f)
% function out_song = create_song(song,instrument,f)

%notes
a_well_below_middle_c = 55;

all_notes = a_well_below_middle_c * 2.^([0:(12*5-1)]/12);

%create unique notes
unique_notes = unique(song,'rows');
%calculate hash max values
rng = ceil(range(unique_notes));
n_h=rng(1);d_h=rng(2);
min_m = floor(min(unique_notes));
n_m=min_m(1);d_m=min_m(2);
%create all possible notes
note_hash = zeros(1,length(unique_notes));
u_note=cell(1,length(unique_notes));
for i = 1:size(unique_notes,1)
    n = unique_notes(i,1);
    d = unique_notes(i,2);
    note_hash(i)=(n-n_m)*(d_h+1)+(d-d_m);
    if n<=0
        cur_note=0;
    else
        cur_note=all_notes(n);
    end
    u_note{i}=create_note(instrument,cur_note,d,f);
end

%create song
out_song=[];
for i = 1:size(song,1)
    n = song(i,1);
    d = song(i,2);
    out_song=[out_song u_note{note_hash==(n-n_m)*(d_h+1)+(d-d_m)}];
end
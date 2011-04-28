function filter = note_filter(n_length,frequency,attack_length)
% filter = note_filter(time, frequency, attack_length)

% n_length=2;
% attack_length=400;
% frequency=8000;
% drop_length=100;
% sustain_level = .5;
% die=100;

%get length
% n_length=length(note);

% create filter components
die=200;
Ts=1/frequency;
attack = 0:1/attack_length:1-1/attack_length;
t1=0:Ts:n_length-Ts*(attack_length+die);
decay = exp(-2.5*t1);
die = exp(-2.5*(n_length-Ts*(attack_length+die-1)))-exp(-2.5*(n_length-Ts*(attack_length+die)))/die:-exp(-2.5*(n_length-Ts*(attack_length+die)))/die:0;
% create filter 
filter = [ attack decay die ];
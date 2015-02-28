(

~playerA = Pbind(
	\instrument, \SinKik,
	\dur, 1,
	\freq, 150
);




~playerB = Pbind(
	\instrument, \sqrKik,
	\dur, 2/3,
	\freq, 150
);




// Sine based bass drum thump

SynthDef(\SinKik, {

	| freq = 150, out = 0, atk = 0.001, rel = 0.5, amp = 1, pan = 0 |

	var env = Env.perc(atk, rel, amp, -2);
	var snd;

	env = 	EnvGen.kr(env, doneAction: 2);

	snd = 	SinOsc.ar(
				XLine.kr([freq, freq * 1.06], freq - 100, 0.1),
				pi/2);

	snd = 	Mix.new(snd);
	snd = Pan2.ar(snd, pan);
	snd = 	snd * env;

	Out.ar(out, snd);
}).add;



// Square based bass drum thump
SynthDef(\sqrKik, {

	| freq = 150, out = 0, atk = 0.001, rel = 0.5, amp = 1, pan = 0 |

	var env = Env.perc(atk, rel, amp, -2);
	var snd;

	env = 	EnvGen.kr(env, doneAction: 2);

	snd = 	LFPulse.ar(
				XLine.kr([freq, freq * 1.06], freq - 100, 0.1),
				0.5);

	snd = 	Mix.new(snd);
	snd =	BLowPass.ar(snd, XLine.kr(freq * 4, freq , 0.1));
	snd = 	snd * env;
	snd = Pan2.ar(snd, pan);

	Out.ar(out, snd);
}).add;



)
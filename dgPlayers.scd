(

~kik = PlazyEnvir({|amp|

	var emphArray, kikgroove;

	var hits, freq, atk, rel;

	freq = 120.rrand(180);
	atk = 0.001.rrand(0.1);
	rel = 0.2.rrand(0.7);

	kikgroove = Bjorklund(2.rrand(5), 8);
	emphArray = 16.collect({0.5.rand}).put(0, 1).put(4, 1).put(8, 1).put(12, 1);

	hits = Array.fill(16, {[Rest, 1].choose});

	Pbind(
		\instrument, \SinKik,
		\dur, Prand([1, Pseq([0.5, 0.5]), Pseq([0.75, 0.25]), Pseq([0.5, 0.25, 0.25])], inf),
		\freq, freq,
		\atk, atk,
		\rel, rel,
		\rest, Pseq(hits, inf),
		\amp, amp*(Pif(Pstep(kikgroove, 0.5) == 1, 0.5, 0.25) +  Pstep(emphArray, 0.25, inf))
	);
});

~snare = PlazyEnvirN({|amp|

	var snareEmph, panI, groove;

	var hits, tight, snare_level;

	tight = 200.rrand(1500);

	hits = Array.fill(16, {[Rest, 1].choose});
	snareEmph = 16.collect({0.5.rand}).put(4,1).put(12,1);
	groove = Bjorklund(2.rrand(9), 16);
	snare_level = 20.rrand(50);


	Pbind(
		\instrument, \SOSsnare,
		\dur, 0.25, // Prand([1, 0.25, 0.5, 0.75], inf),
		\freq, Pstep([Rest, 405, Rest, 405], Pseq([0.25, 1.75, 0.25, 1.75], inf), inf),
		\rest, Pseq(hits, inf),
		\amp, amp * Pseq(snareEmph, inf),
		\pan, Pbrown(-0.5, 0.5, 0.5),
		\drum_mode_level, 0.25 * Pstep(snareEmph, 0.25, inf),
		\sustain, 0.3 * Pstep(snareEmph, 0.25, inf),
		\snare_tightness, tight,
		\snare_level, snare_level
	);
});

~hiHat = PlazyEnvir({|amp|

	var hatEmph;

	var hits, sus, freq;

	sus = 0.1.rrand(3);

	hatEmph = 16.collect({0.5.rand}) + Bjorklund(5.rrand(13), 16);

	hits = Array.fill(16, {[Rest, 1].choose});
	freq = 2000.rrand(7000);

	Pbind(
		\instrument, \SOShats,
		\amp, amp,
		\dur, 0.25,
		\freq, Pbrown(freq, freq + 1000, 20),
		\pan, Pbrown(-1, 1, 0.25),
		\sustain, Pseq(hatEmph, inf) * sus,
		\rest, Pseq(hits, inf)
	);

});

~bass = PlazyEnvir({|amp|

	var degrees, hits, rq, filtFreq, width;

	filtFreq = 300.rrand(500);
	rq = 0.1.rrand(1);
	width = 0.1.rrand(1);
	hits = Array.fill(4, {[Rest, 1].choose});
	degrees = Array.fill(8, {10.rand});

	Pbind(
		\instrument, \squareSynth,
		\octave, 2,
		\degree, Prand(degrees, inf),
		\dur, PdurStutter(Pwhite(0, 3), Pshuf([2, 1, 0.5, 0.5], inf)),
		\amp, amp,
		\rest, Pseq(hits, inf),
		\legato, 0.95,
		\filtFreq, Pbrown(filtFreq, 600, 25),
		\rq, rq,
		\width, width
	);

});


)



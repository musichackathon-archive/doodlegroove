(

~kik = PlazyEnvir({

	arg emphArray, kikgroove;

	var hits;

	hits = Array.fill(16, {[Rest, 1].choose});

	Pbind(
		\instrument, \SinKik,
		\dur, Prand([1, Pseq([0.5, 0.5]), Pseq([0.75, 0.25]), Pseq([0.5, 0.25, 0.25])], inf),
		\freq, 150,
		\rest, Pseq(hits, inf),
		\amp, (Pif(Pstep(kikgroove, 0.5) == 1, 0.5, 0.25) +  Pstep(emphArray, 0.25, inf))
	);
});

~snare = PlazyEnvirN({

	arg snareEmph, panI, groove;

	var hits;

	hits = Array.fill(16, {[Rest, 1].choose});


	Pbind(
		\instrument, \SOSsnare,
		\dur, 0.25, // Prand([1, 0.25, 0.5, 0.75], inf),
		\freq, Pstep([Rest, 405, Rest, 405], Pseq([0.25, 1.75, 0.25, 1.75], inf), inf),
		\rest, Pseq(hits, inf),
		\amp, groove * 0.5 + Pstep(snareEmph * 0.1, 0.25, inf),
		\pan, Pbrown(-0.5, 0.5, 0.5),
		\drum_mode_level, 0.25 * Pstep(snareEmph, 0.25, inf),
		\sustain, 0.3 * Pstep(snareEmph, 0.25, inf)
	);
});

~hiHat = PlazyEnvir({

	arg hatEmph;

	Pbind(
		\instrument, \SOShats,
		\dur, 0.25,
		\freq, Pbrown(4000, 7000, 20),
		\pan, Pbrown(-1, 1, 0.25),
		\sustain, Pseq(hatEmph, inf) * 0.2
	);

});


~playerA = (Ppar([~hiHat, ~kik, ~snare]) <>
	(
		kikgroove:Pbjorklund(Pkey(\bNum)/2.floor, 8, inf, 8),
		groove: Pbjorklund(Pkey(\bNum), 16, inf, 8),
		emphArray: 16.collect({0.5.rand}).put(0, 1).put(4, 1).put(8, 1).put(12, 1),
		snareEmph: 16.collect({0.5.rand}).put(4,1).put(12,1),
		hatEmph: 16.collect({0.5.rand}) + Bjorklund(5.rrand(13), 16),
		panI: 0.5.rrand(0)
	)
);

)



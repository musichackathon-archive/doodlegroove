(

~kik = PlazyEnvir({

	arg emphArray;


	Pbind(
		\instrument, \SinKik,
		\dur, Prand([1, Pseq([0.5, 0.5]), Pseq([0.75, 0.25]), Pseq([0.5, 0.25, 0.25])], inf),
		\freq, 150,
		\amp, Pstep(emphArray, 0.25, inf)
	);
});

~snare = PlazyEnvirN({

	arg snareEmph, panI;



	Pbind(
		\instrument, \SOSsnare,
		\dur, Prand([1, 0.25, 0.5, 0.75], inf),
		\freq, Pstep([Rest, 405, Rest, 405], Pseq([0.25, 1.75, 0.25, 1.75], inf), inf),
		\amp, Pstep(snareEmph, 0.25, inf) * 0.2,
		\pan, panI - 1.0.rand,
		\drum_mode_level, 0.25 * Pstep(snareEmph, 0.25, inf),
		\sustain, 0.3 * Pstep(snareEmph, 0.25, inf)
	);

});


~playerA = (Ppar([~kik, ~snare]) <>
	(
		emphArray: [1,0.1,0.25,0.1,1,0.1,0.25,0.1,1,0.1,0.25,0.1,1,0.1,0.25,0.1],
		snareEmph: 16.collect({0.75.rand}).put(4,1).put(12,1),
		panI: 0.5.rrand(0)
	)
);

)



16.collect({0.75.rand}).put(4,1).put(12,1)
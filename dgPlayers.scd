(

~kik = PlazyEnvir({

	arg emphArray, kikgroove;


	Pbind(
		\instrument, \SinKik,
		\dur, Prand([1, Pseq([0.5, 0.5]), Pseq([0.75, 0.25]), Pseq([0.5, 0.25, 0.25])], inf),
		\freq, 150,
		\amp, Pif(Pstep(kikgroove, 0.5) == 1, 0.5, 0.25) +  Pstep(emphArray, 0.25, inf)
	);
});

~snare = PlazyEnvirN({

	arg snareEmph, panI, groove;



	Pbind(
		\instrument, \SOSsnare,
		\dur, 0.25, // Prand([1, 0.25, 0.5, 0.75], inf),
		\freq, Pstep([Rest, 405, Rest, 405], Pseq([0.25, 1.75, 0.25, 1.75], inf), inf),
		\amp,  groove * 0.5 + Pstep(snareEmph * 0.1, 0.25, inf),
		\pan, Pbrown(-0.5, 0.5, 0.5),
		\drum_mode_level, 0.25 * Pstep(snareEmph, 0.25, inf),
		\sustain, 0.3 * Pstep(snareEmph, 0.25, inf)
	);



});


~playerA = (Ppar([~kik, ~snare]) <>
	(
		kikgroove:Pbjorklund(Pkey(\bNum)/2.floor, 8, inf, 8),
		groove: Pbjorklund(Pkey(\bNum), 16, inf, 8),
		emphArray: [1,0.1,0.25,0.1,1,0.1,0.25,0.1,1,0.1,0.25,0.1,1,0.1,0.25,0.1],
		snareEmph: 16.collect({0.5.rand}).put(4,1).put(12,1),
		panI: 0.5.rrand(0)
	)
);

)



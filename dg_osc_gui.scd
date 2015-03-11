OSCdef.freeAll
//
//

(
// faders ======================================
OSCdef.newMatching(\xfade01,
	{|msg, time, addr, recvPort|
		// ('xfade01: ' ++ msg[1]).postln;
		~masterA.set(\amp, 1-msg[1]);
		~masterB.set(\amp, msg[1]);

		~cueA.set(\amp, msg[1]);
		~cueB.set(\amp, 1-msg[1]);
	},
'/1/xfade01');

// RANDOMS ======================================
OSCdef.newMatching(\randomA_01,
	{|msg, time, addr, recvPort|
		// ('randomA_01: ' ++ msg[1]).postln;
		if (msg[1]!=1, {~a_kik_A = (~kik <> (out:~groupA_bus, group:~groupA)).play(quant:1)},{~a_kik_A.stop})
	},
'/1/randomA_01');

OSCdef.newMatching(\randomA_02,
	{|msg, time, addr, recvPort|
		// ('randomA_02: ' ++ msg[1]).postln;
		if (msg[1]!=1, {~a_snare_A = (~snare <> (out:~groupA_bus, group:~groupA)).play(quant:1)},{~a_snare_A.stop})
	},
'/1/randomA_02');

OSCdef.newMatching(\randomA_03,
	{|msg, time, addr, recvPort|
		// ('randomA_03: ' ++ msg[1]).postln;
		if (msg[1]!=1, {~a_hat_A = (~hiHat <> (out:~groupA_bus, group:~groupA)).play(quant:1)},{~a_hat_A.stop})
	},
'/1/randomA_03');

OSCdef.newMatching(\randomA_04,
	{|msg, time, addr, recvPort|
		// ('randomA_03: ' ++ msg[1]).postln;
		if (msg[1]!=1, {~a_bass_A = (~bass <> (out:~groupA_bus, group:~groupA)).play(quant:1)},{~a_bass_A.stop})
	},
'/1/randomA_04');

//////

OSCdef.newMatching(\randomB_01,
	{|msg, time, addr, recvPort|
		// ('randomB_01: ' ++ msg[1]).postln;
		if (msg[1]!=1, {~b_kik_B = (~kik <> (out:~groupB_bus, group:~groupB)).play(quant:1)},{~b_kik_B.stop})
	},
'/1/randomB_01');

OSCdef.newMatching(\randomB_02,
	{|msg, time, addr, recvPort|
		// ('randomB_02: ' ++ msg[1]).postln;
		if (msg[1]!=1, {~b_snare_B = (~snare <> (out:~groupB_bus, group:~groupB)).play(quant:1)},{~b_snare_B.stop})
	},
'/1/randomB_02');

OSCdef.newMatching(\randomB_03,
	{|msg, time, addr, recvPort|
		// ('randomB_03: ' ++ msg[1]).postln;
		if (msg[1]!=1, {~b_hat_B = (~hiHat <> (out:~groupB_bus, group:~groupB)).play(quant:1)},{~b_hat_B.stop})
	},
'/1/randomB_03');

OSCdef.newMatching(\randomB_04,
	{|msg, time, addr, recvPort|
		// ('randomB_04: ' ++ msg[1]).postln;
		if (msg[1]!=1, {~b_bass_B = (~bass <> (out:~groupB_bus, group:~groupB)).play(quant:1)},{~b_bass_B.stop})
	},
'/1/randomB_04');

// CUES ======================================

OSCdef.newMatching(\cueA_01,
	{|msg, time, addr, recvPort|
		('cueA_01: ' ++ msg[1]).postln;
		if (msg[1]==1, {~a_kik_A = (~kik <> (out:~groupA_bus, group:~groupA)).play(quant:1)},{~a_kik_A.stop})
	},
'/1/cueA_01');

OSCdef.newMatching(\cueA_02,
	{|msg, time, addr, recvPort|
		// ('cueA_02: ' ++ msg[1]).postln;
		if (msg[1]==1, {~a_snare_A = (~snare <> (out:~groupA_bus, group:~groupA)).play(quant:1)},{~a_snare_A.stop})
	},
'/1/cueA_02');

OSCdef.newMatching(\cueA_03,
	{|msg, time, addr, recvPort|
		// ('cueA_03: ' ++ msg[1]).postln;
		if (msg[1]==1, {~a_hat_A = (~hiHat <> (out:~groupA_bus, group:~groupA).play(quant:1))},{~a_hat_A.stop})
	},
'/1/cueA_03');

OSCdef.newMatching(\cueA_04,
	{|msg, time, addr, recvPort|
		// ('cueA_04: ' ++ msg[1]).postln;
		if (msg[1]==1, {~a_bass_A = (~bass <> (out:~groupA_bus, group:~groupA)).play(quant:1)},{~a_bass_A.stop})
	},
'/1/cueA_04');


// ===

OSCdef.newMatching(\cueB_01,
	{|msg, time, addr, recvPort|
		// ('cueB_01: ' ++ msg[1]).postln;
		if (msg[1]==1, {~b_kik_B = (~kik <> (out:~groupB_bus, group:~groupB)).play(quant:1)},{~b_kik_B.stop})
	},
'/1/cueB_01');

OSCdef.newMatching(\cueB_02,
	{|msg, time, addr, recvPort|
		// ('cueB_02: ' ++ msg[1]).postln;
		if (msg[1]==1, {~b_snare_B = (~snare <> (out:~groupB_bus, group:~groupB)).play(quant:1)},{~b_snare_B.stop})
	},
'/1/cueB_02');

OSCdef.newMatching(\cueB_03,
	{|msg, time, addr, recvPort|
		// ('cueB_03: ' ++ msg[1]).postln;
		if (msg[1]==1, {~b_hat_B = (~hiHat <> (out:~groupB_bus, group:~groupB)).play(quant:1)},{~b_hat_B.stop})
	},
'/1/cueB_03');

OSCdef.newMatching(\cueB_04,
	{|msg, time, addr, recvPort|
		// ('cueB_04: ' ++ msg[1]).postln;
		if (msg[1]==1, {~b_bass_B = (~bass <> (out:~groupB_bus, group:~groupB)).play(quant:1)},{~b_bass_B.stop})
	},
'/1/cueB_04');


)
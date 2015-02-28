(
// faders ======================================
OSCdef.newMatching(\xfade01,
	{|msg, time, addr, recvPort|
		('xfade01: ' ++ msg[1]).postln;
	},
'/1/xfade01');

OSCdef.newMatching(\xfade02,
	{|msg, time, addr, recvPort|
		('xfade02: ' ++ msg[1]).postln;
	},
'/1/xfade02');

OSCdef.newMatching(\xfade03,
	{|msg, time, addr, recvPort|
		('xfade03: ' ++ msg[1]).postln;
	},
'/1/xfade03');

// cues ======================================


OSCdef.newMatching(\randomA_01,
	{|msg, time, addr, recvPort|
		('randomA_01: ' ++ msg[1]).postln;
	},
'/1/randomA_01');

OSCdef.newMatching(\randomA_02,
	{|msg, time, addr, recvPort|
		('randomA_02: ' ++ msg[1]).postln;
	},
'/1/randomA_02');

OSCdef.newMatching(\randomA_03,
	{|msg, time, addr, recvPort|
		('randomA_03: ' ++ msg[1]).postln;
	},
'/1/randomA_03');

OSCdef.newMatching(\randomB_01,
	{|msg, time, addr, recvPort|
		('randomB_01: ' ++ msg[1]).postln;
	},
'/1/randomB_01');

OSCdef.newMatching(\randomB_02,
	{|msg, time, addr, recvPort|
		('randomB_02: ' ++ msg[1]).postln;
	},
'/1/randomB_02');

OSCdef.newMatching(\randomB_03,
	{|msg, time, addr, recvPort|
		('randomB_03: ' ++ msg[1]).postln;
	},
'/1/randomB_03');

// CUES ======================================

OSCdef.newMatching(\cueA_01,
	{|msg, time, addr, recvPort|
		('cueA_01: ' ++ msg[1]).postln;
	},
'/1/cueA_01');

OSCdef.newMatching(\cueA_02,
	{|msg, time, addr, recvPort|
		('cueA_02: ' ++ msg[1]).postln;
	},
'/1/cueA_02');

OSCdef.newMatching(\cueA_03,
	{|msg, time, addr, recvPort|
		('cueA_03: ' ++ msg[1]).postln;
	},
'/1/cueA_03');

OSCdef.newMatching(\cueB_01,
	{|msg, time, addr, recvPort|
		('cueB_01: ' ++ msg[1]).postln;
	},
'/1/cueB_01');

OSCdef.newMatching(\cueB_02,
	{|msg, time, addr, recvPort|
		('cueB_02: ' ++ msg[1]).postln;
	},
'/1/cueB_02');

OSCdef.newMatching(\cueB_03,
	{|msg, time, addr, recvPort|
		('cueB_03: ' ++ msg[1]).postln;
	},
'/1/cueB_03');

)
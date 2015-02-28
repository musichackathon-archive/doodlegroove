// ================================================================
// Numark ORBIT controls
// ================================================================
// watch all midi traffic
// ================================================================
(
var notes, on, off, wheel;

MIDIClient.init;
MIDIIn.connectAll;

notes = Array.newClear(128);    // array has one slot per possible MIDI note

on = MIDIFunc.noteOn({ |veloc, num, chan, src|
	('NOTE veloc: ' ++ veloc ++ ' || num: ' ++ num ++ ' || chan: ' ++ chan).postln;
	/*    notes[num] = Synth(\default, [\freq, (num+10).midicps,
        \amp, veloc * 0.00315]);*/
});

off = MIDIFunc.noteOff({ |veloc, num, chan, src|
	('NOTE veloc: ' ++ veloc ++ '   || num: ' ++ num ++ ' || chan: ' ++ chan).postln;
	//     notes[num].release;
});

// higher selectors - num modifiers 1,2,3,4
// higher selectors - val 1,2,3,4 // num 2 // chan 15
// lower selectors - val 1,2,3,4 // num 1 // chan 15
// lower selectors - channel modifiers 0,1,2,3

// right button accelerometer - num 10, channel modifiable
// left button accelerometer - num 9, channel modifiable

wheel = MIDIFunc.cc({|val, num, chan, src|
	('WHEEL val: ' ++ val ++ '  || num: ' ++ num ++ '  || chan: ' ++ chan).postln;
});

q = { on.free; off.free; };
)

// ================================================================
// sorted controls monitor
// ================================================================
~wheel = MIDIFunc.cc({|val, num, chan, src|
	('wheel ' ++ val
		++ ' || pad bank: ' ++ (chan+1).asString
		++ ' || k-select: ' ++ num
		).postln;
},[1,2,3,4],[0,1,2,3]);

~pad_bank_select = MIDIFunc.cc({|val, num, chan, src|
	('pad bank change: ' ++ val).postln
},1,15);

~k_select = MIDIFunc.cc({|val, num, chan, src|
	('k-select change: ' ++ val).postln
},2,15);
// * 0. hook up the controller
// 1. build a crossfader with cue
// 2. expand to multiple channels on each side
// 3. build instruments for the channels
// 4. make randomization of controls on each instrument

// ================================================================
// mixing environment
// ================================================================
FreqScope.new
s.plotTree

(
SynthDef(\dice_01, {|out = 0, amp = 0.1, pan = 0, gate = 1, freq=440|
	var env, sig;
	env = EnvGen.kr(Env.asr(0.01,1,0.01),gate, 1, doneAction:2);
	sig = env * Saw.ar(freq);
	sig = Pan2.ar(sig, pan);
	Out.ar(out, amp * sig);
}).add;


SynthDef(\dice_send, {|in = 4, out = 2, gate = 1, amp = 0.1|
	var env, sig;
	env = EnvGen.kr(Env.asr(0.01,1,0.01),gate, 1, doneAction:2);
	sig = env * In.ar(in);
	Out.ar(out, amp * sig);
}).add;
)

(
// 0,1 - master channels
// 2,3 - cue channels
// 4,5 - source A
// 6,7 - source B

~master_bus = 0;
~cue_bus = 1;

~groupA = Group.new;
~groupB = Group.new;

// ~synthA_01 = Synth(\dice_01,[\out, 4, \freq, 440],~groupA, \addToHead);
// ~synthB_01 = Synth(\dice_01,[\out, 6, \freq, 550],~groupB, \addToHead);

~cueA = Synth(\dice_send,[\out, ~cue_bus, \in, 4], ~groupA, \addToTail);
~cueB = Synth(\dice_send,[\out, ~cue_bus, \in, 6], ~groupB, \addToTail);

~masterA = Synth(\dice_send,[\out, ~master_bus, \in, 4], ~groupA, \addToTail);
~masterB = Synth(\dice_send,[\out, ~master_bus, \in, 6], ~groupB, \addToTail);
)

~synthA_01.set(\amp, 0.3, \freq, 50)
~synthB_01.set(\amp, 0.3, \freq, 50)


~cueA.set(\amp, 0.5)
~cueB.set(\amp, 0.1)

~masterA.set(\amp, 0.0)
~masterB.set(\amp, 0.1)

(
~cueA.free;
~cueB.free;

~masterA.free;
~masterB.free;

~groupA.free;
~groupB.free;
)

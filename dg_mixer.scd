// * 0. hook up the controller
// 1. build a crossfader with cue
// 2. expand to multiple channels on each side
// 3. build instruments for the channels
// 4. make randomization of controls on each instrument

// Boot the server with the aggregate device
s = Server.local
o = Server.local.options;
o.device = "Aggregate Device"
s.boot;

// ================================================================
// mixing environment
// ================================================================
FreqScope.new
s.plotTree

(
SynthDef(\DG_01, {|out = 0, amp = 0.1, pan = 0, gate = 1, freq=440|
	var env, sig;
	env = EnvGen.kr(Env.asr(0.01,1,0.01),gate, 1, doneAction:2);
	sig = env * Saw.ar(freq);
	sig = Pan2.ar(sig, pan);
	Out.ar(out, amp * sig);
}).add;


SynthDef(\DG_send_mono, {|in = 4, out = 2, gate = 1, amp = 0.1|
	var env, sig;
	env = EnvGen.kr(Env.asr(0.01,1,0.01),gate, 1, doneAction:2);
	sig = env * In.ar(in,1);
	Out.ar(out, amp * sig);
}).add;

SynthDef(\DG_send_stereo, {|in = 4, out = 2, gate = 1, amp = 0.1|
	var env, sig;
	env = EnvGen.kr(Env.asr(0.01,1,0.01),gate, 1, doneAction:2);
	sig = env * In.ar(in,2);
	Out.ar(out, amp * sig);
}).add;

)

(
// 0,1 - master channels
// 2,3 - cue channels
// 4,5 - source A
// 6,7 - source B

// 2-channel audio interface
//~master_bus = 0;
//~cue_bus = 1;

// 4-channel aggregate audio device with H4n
~master_bus = [2,3];
~cue_bus = [0,1];

~groupA = Group.new;
~groupB = Group.new;

~cueA = Synth(\DG_send_stereo,[\out, ~cue_bus, \in, 4], ~groupA, \addToTail);
~cueB = Synth(\DG_send_stereo,[\out, ~cue_bus, \in, 6], ~groupB, \addToTail);

~masterA = Synth(\DG_send_stereo,[\out, ~master_bus, \in, 4], ~groupA, \addToTail);
~masterB = Synth(\DG_send_stereo,[\out, ~master_bus, \in, 6], ~groupB, \addToTail);
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

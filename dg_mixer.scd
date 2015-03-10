// Boot the server with the aggregate device
s = Server.local
o = Server.local.options;
// o.device = "Aggregate Device"
s.boot;

// ================================================================
// mixing environment
// ================================================================
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
// 2-channel audio interface
~master_bus = 0;
~cue_bus = 1;
~groupA_bus = 2;
~groupB_bus = 3;

~groupA = Group.new;
~groupB = Group.new;

~cueA = Synth(\DG_send_mono,[\out, ~cue_bus, \in, ~groupA_bus], ~groupA, \addToTail);
~cueB = Synth(\DG_send_mono,[\out, ~cue_bus, \in, ~groupB_bus], ~groupB, \addToTail);

~masterA = Synth(\DG_send_mono,[\out, ~master_bus, \in, ~groupA_bus], ~groupA, \addToTail);
~masterB = Synth(\DG_send_mono,[\out, ~master_bus, \in, ~groupB_bus], ~groupB, \addToTail);
)

(
// 4-channel aggregate audio device with H4n
~master_bus = 0;
~cue_bus = 2;
~groupA_bus = 4
~groupB_bus = 6;

~groupA = Group.new;
~groupB = Group.new;

~cueA = Synth(\DG_send_stereo,[\out, ~cue_bus, \in, ~groupA_bus], ~groupA, \addToTail);
~cueB = Synth(\DG_send_stereo,[\out, ~cue_bus, \in, ~groupB_bus], ~groupB, \addToTail);

~masterA = Synth(\DG_send_stereo,[\out, ~master_bus, \in, ~groupA_bus], ~groupA, \addToTail);
~masterB = Synth(\DG_send_stereo,[\out, ~master_bus, \in, ~groupB_bus], ~groupB, \addToTail);
)

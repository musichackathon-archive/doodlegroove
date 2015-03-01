a = (~A <> (out:4, group:~groupA, bNum: 2.rrand(13))).play;
b = (~playerB <> (out:6, group:~groupB, bNum: 2.rrand(13))).play;

~a_kik = (~kik <> (out:4, group:~groupA)).play;
~a_snare = (~snare <> (out:4, group:~groupA)).play;
~a_hat = (~hiHat <> (out:4, group:~groupA)).play;

~b_kik = (~kik <> (out:6, group:~groupB)).play;
~b_snare = (~snare <> (out:6, group:~groupB)).play;
~b_hat = (~hiHat <> (out:6, group:~groupB)).play;


~a_kik.stop;
~a_snare.stop;
~a_hat.stop;

~b_kik.stop;
~b_snare.stop;
~b_hat.stop;


a.stop;
b.stop;

a.play
b.play

~cueA.set(\amp, 1);
~cueB.set(\amp, 0);
~masterA.set(\amp,0);
~masterB.set(\amp,1);

~cueA.set(\amp, 0);
~cueB.set(\amp, 1);
~masterA.set(\amp,1);
~masterB.set(\amp,0);

OSCFunc.trace(true)
OSCFunc.trace(false)
OSCdef.freeAll


if (1==0, {'one'.postln}, {'two'.postln})
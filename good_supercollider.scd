Server.local.options.inDevice = "";

// :SClangStart   then
// F5 to load in tidalvim

(
s.options.outDevice = "Loopback Audio 2";
s.options.inDevice =  "Loopback Audio 2";
//s.options.numInputBusChannels = 0;
//s.options.inputStreamsEnabled = "00000000";
//s.options.inputDevice =
s.options.numBuffers = 2048 * 16;
s.options.memSize = 8192 * 32;
s.options.sampleRate = nil;
s.quit;

s.waitForBoot {
	~dirt = SuperDirt(2, s);
	~dirt.loadSoundFiles;
	~dirt.loadSoundFiles("/home/rseymour/src/tidal-notes/505/*", true);
		~dirt.loadSoundFiles("/Users/rseymour/src/tidal-notes/505/*", true);
	//~dirt.loadSoundFiles("/home/rseymour/src/tidal-notes/samples/*", true);
	//~dirt.loadSoundFiles("/home/rseymour/Projects/smaples/*", true);
//	~dirt.loadSoundFiles("/home/rseymour/src/vroomvroom/samples/*", true);
	~dirt.loadSoundFiles("/home/rseymour/Play/scfw19/samples/*", true);
	s.sync;
	~dirt.start(57120,0!12);
}

);


~dirt.loadSoundFiles("~/Projects/grace", true)

SuperDirt.start;

~dirt.loadSoundFiles("/Users/rseymour/Play/scfw19/samples/*", true);

(
s.quit;

SuperDirt.stop;
)

////needed for VCV
MIDIClient.init;
~midiOut = MIDIOut.newByName("IAC Driver", "Bus 1"); // substitute your own device here
// vcv latency as of 2019-07-01 at pismo 0.07
~midiOut.latency = 0.07;
~dirt.soundLibrary.addMIDI(\midi, ~midiOut);

// Evaluate the block below to start the mapping MIDI -> OSC.
(
var on, off, cc;
var osc;

osc = NetAddr.new("127.0.0.1", 6010);

MIDIClient.init;
MIDIIn.connectAll;

on = MIDIFunc.noteOn({ |val, num, chan, src|
	osc.sendMsg("/ctrl", num.asString, val/127);
});

off = MIDIFunc.noteOff({ |val, num, chan, src|
	osc.sendMsg("/ctrl", num.asString, 0);
});

cc = MIDIFunc.cc({ |val, num, chan, src|
	osc.sendMsg("/ctrl", num.asString, val/127);
});

if (~stopMidiToOsc != nil, {
	~stopMidiToOsc.value;
});

~stopMidiToOsc = {
	on.free;
	off.free;
	cc.free;
};
)

// Evaluate the line below to stop it.
~stopMidiToOsc.value;


	~dirt.loadSoundFiles("/Users/rseymour/src/tidal-notes/505/*", true);


	~dirt.loadSoundFiles("/Users/rseymour/Projects/smaples/*", true);


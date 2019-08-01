// :SClangStart   then
// F5 to load in tidalvim

(
//s.options.outDevice = "Loopback Audio 2";
//s.options.inDevice =  "Loopback Audio 2";
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
	//~dirt.loadSoundFiles("/home/rseymour/src/tidal-notes/samples/*", true);
	//~dirt.loadSoundFiles("/home/rseymour/Projects/smaples/*", true);
//	~dirt.loadSoundFiles("/home/rseymour/src/vroomvroom/samples/*", true);
	~dirt.loadSoundFiles("/home/rseymour/Play/scfw19/samples/*", true);
	s.sync;
	~dirt.start(57120,0!12);
}

);



// Start SuperDirt
SuperDirt.start;

// SuperDirt custom samples and synths


// Init Midi
MIDIClient.init;

// to PlugData
~midiOut = MIDIOut.newByName("to plugdata", "to plugdata"); // substitute your own device here

// Configure the 'synth' that dirt will call it
~dirt.soundLibrary.addMIDI(\m, ~midiOut);

/*
This is an example startup file.
If you want to modify it, best copy it elsewhere to keep the git repository clean.

You can then load it by calling
"path/to/my/superdirt_startup.scd".load
from the supercollider startup file

The supercollider startup file is to be found in
Platform.userAppSupportDir +/+ "startup.scd", !!!
or via the menu File > Open startup file
*/
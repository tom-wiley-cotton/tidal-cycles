:set -XOverloadedStrings
:set prompt ""
import Sound.Tidal.Context
import Sound.Tidal.Stream
import System.IO (hSetEncoding, stdout, utf8)
hSetEncoding stdout utf8

-- Define the OSC target
:{
let target =
      Target {oName = "puredata",
              oAddress = "127.0.0.1",
              oPort = 7000,
              oLatency = 0.02,
              oSchedule = Live,
              oWindow = Nothing,
              oHandshake = False,
              oBusPort = Nothing
             }
    formats = [
      OSC "/pd/bang"      $ ArgList [("bang", (Just $ VI 1))],
      OSC "/pd/n"         $ ArgList [("n", (Just $ VI 0))],
      OSC "/pd/velocity"  $ ArgList [("velocity", Nothing)],
      OSC "/pd/s"         $ ArgList [("s", Nothing)],
      OSC "/pd/sf"        $ ArgList [("sf", Nothing)],
      OSC "/pd/offset"    $ ArgList [("offset", Nothing)],
      OSC "/pd/param1"    $ ArgList [("param1", Nothing)],
      OSC "/pd/param2"    $ ArgList [("param2", Nothing)],
      OSC "/pd/param3"    $ ArgList [("param3", Nothing)],
      OSC "/pd/param4"    $ ArgList [("param4", Nothing)],
      OSC "/pd/param5"    $ ArgList [("param5", Nothing)],
      OSC "/pd/param6"    $ ArgList [("param6", Nothing)],
      OSC "/pd/param7"    $ ArgList [("param7", Nothing)],
      OSC "/pd/param8"    $ ArgList [("param8", Nothing)],
      OSC "/pd/warp"      $ ArgList [("warp", Nothing)],
      OSC "/pd/fold"      $ ArgList [("fold", Nothing)],
      OSC "/pd/filterenv" $ ArgList [("filterenv", Nothing)],
      OSC "/pd/pitchenv"  $ ArgList [("pitchenv", Nothing)],
      OSC "/pd/lfo1"      $ ArgList [("lfo1", Nothing)],
      OSC "/pd/lfo2"      $ ArgList [("lfo2", Nothing)],
      OSC "/pd/lfo3"      $ ArgList [("lfo3", Nothing)]
      ]
    warp      = pF "warp"
    fold      = pF "fold"
    filterenv = pF "filterenv"
    pitchenv  = pF "pitchenv"
    lfo1      = pF "lfo1"
    lfo2      = pF "lfo2"
    lfo3      = pF "lfo3"
    param1    = pF "param1"
    param2    = pF "param2"
    param3    = pF "param3"
    param4    = pF "param4"
    param5    = pF "param5"
    param6    = pF "param6"
    param7    = pF "param7"
    param8    = pF "param8"
    oscmap = [(target, formats)]
:}

-- Start the stream
stream <- startStream defaultConfig oscmap

-- Define shortcuts for convenience
:{
let pd1 = streamReplace stream 1
    pd2 = streamReplace stream 2
    pd3 = streamReplace stream 3
    pd4 = streamReplace stream 4
    pd5 = streamReplace stream 5
    pd6 = streamReplace stream 6
    pd7 = streamReplace stream 7
    pd8 = streamReplace stream 8
    pdhush = do
      pd1 silence
      pd2 silence
      pd3 silence
      pd4 silence
      pd5 silence
      pd6 silence
      pd7 silence
      pd8 silence
:}

:set prompt "tidal> "
:set prompt-cont ""

:set prompt "tidal> "
:set prompt-cont ""
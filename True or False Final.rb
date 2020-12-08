#Pace of the song
use_bpm 90

#Introduction: just the melody with a twist at the end
define :intro do
  3.times do
    use_synth :piano
    play_pattern_timed [65, 69, 67, 70, 72, 67], [1, 0.5, 0.5, 0.5, 0.5, 1]
  end
  play 65
  sleep 1
  play 69
  sleep 0.5
  play 67
  sleep 0.5
  play 70, sustain: 2
  sleep 1
  play 72, sustain: 2
  sleep 1
end

#Melody that is the cornerstone of the song! 
define :melody do
  3.times do
    use_synth :piano
    play_pattern_timed [65, 69, 67, 70, 72, 67], [1, 0.5, 0.5, 0.5, 0.5, 1]
  end
  play_pattern_timed [65, 69, 67, 70, 70, 70, 70, 70, 70, 70, 70], [1, 0.5, 0.5, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25, 0.25]
end

#Drum breat
define :drumbeat do
  3.times do
    sample :bd_boom
    sleep 0.5
    sample :bd_klub, rate: 2
    sleep 0.25
    sample :bd_boom
    sleep 0.25
    sample :sn_dolf
    sleep 0.25
    sample :bd_pure
    sleep 0.75
    sample :bd_ada
    sleep 1
    sample :drum_snare_hard
    sleep 1
    sample :bd_klub, rate: 2
  end
  sample :bd_boom
  sleep 0.5
  sample :bd_klub, rate: 2
  sleep 0.25
  sample :bd_boom
  sleep 0.25
  sample :sn_dolf
  sleep 1
  sample :bd_klub, rate: 2
  8.times do
    sample :drum_cymbal_closed
    sleep 0.25
  end
end

#Chords - chords that match the melody to be played throughout song
define :chords do
  play chord(:F4, :major), amp: 2, release: 1.5
  sleep 2
  play chord(:G4, :minor), amp: 2, release: 1.5
  sleep 2
  play chord(:F4, :major), amp: 2, release: 1.5
  sleep 2
  play chord(:G4, :minor), amp: 2, release: 1.5
  sleep 2
  play chord(:F4, :major), amp: 2, release: 1.5
  sleep 2
  play chord(:G4, :minor), amp: 2, release: 1.5
  sleep 2
  play chord(:F4, :major), amp: 2, release: 1.5
  sleep 2
  play chord(:G4, :minor), amp: 2, release: 1.5
  sleep 2
end

#Versenotes - the three hard notes at the end of a stanza
define :versenotes do
  sleep 14
  play 72, amp: 3, pan: 1
  sleep 1
  play 67, amp: 3, pan: -1
  sleep 1
  play 65, amp: 3
end

#verse
define :verse do
  with_fx :reverb do
    in_thread do
      2.times do
        drumbeat
      end
    end
    in_thread do
      2.times do
        chords
      end
    end
    in_thread do
      2.times do
        versenotes
      end
    end
  end
end

#Chorus
define :chorus do
  sleep 32
  in_thread do
    2.times do
      drumbeat
    end
  end
  in_thread do
    2.times do
      chords
    end
  end
  in_thread do
    2.times do
      melody
    end
  end
end

#Finale - melody with a unique ending, snaps, fadeout.
define :finale do
  in_thread do
    7.times do
      use_synth :piano
      play_pattern_timed [65, 69, 67, 70, 72, 67], [1, 0.5, 0.5, 0.5, 0.5, 1]
    end
    play 65
    sleep 1
    play 69
    sleep 0.5
    play 67
    sleep 0.5
    play 70, sustain: 2
    sleep 0.5
    play 72, sustain: 5
    sleep 1
    play 67
    sleep 0.5
    play 65, sustain: 10
  end
  in_thread do
    8.times do
      sample :perc_snap
      sleep 2
    end
  end
end

#Begin Song
intro
verse
chorus
sleep 32
verse
chorus
sleep 32
verse
sleep 32
finale










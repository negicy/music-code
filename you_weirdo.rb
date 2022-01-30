# Welcome to Sonic Pi
live_loop :drums do
  sync :beat
  tick
  (ring 2, 4, 3).tick.times do
    
    sample :drum_snare_hard, amp: 1, rate: (ring 1.8, 1.3, 1).look, amp: 0.5
    sample :drum_cymbal_closed, amp: 0.6
    sleep 0.12
  end
  sample :drum_snare_soft, amp: 0.5
  sleep [0.2, 0.15].look * 2.1
end

live_loop :beat do
  sample :bd_haus, amp: 1.5
  sleep (ring 0.5, 1.0).tick
end


live_loop :synth, sync: :drums do
  tick
  with_fx :lpf, phase: 0.5 do
    sample :elec_tick, rate: (ring 0.2, 0.4, 0.3).look, amp: 0.9
    sleep 0.17
  end
end

live_loop :bass, sync: :drums do
  tick
  with_fx :tremolo, phase: 0.7 do
    sample :bass_dnb_f, rate: (ring 2.4, 0.8, 1.8).choose, release: 0.7, amp: 0.7
    sleep rrand(0.2, 0.4)
  end
end

live_loop :sample, sync: :drums do
  tick
  (ring 1, 2, 3).look.times do
    sample :loop_weirdo, rate: (ring 1.2, -1, -0.85).look, start: (ring 0, 0.2).choose, finish: (ring 1.0, 0.5).look, amp: 0.7
    sleep 1.0
  end
  sample (ring :elec_blip2, :elec_blip, :perc_till).look
  
  sleep 6
end

# Welcome to Sonic Pi v3.3.1
live_loop :drums do
  tick
  24.times do
    
    sync :beat
    (ring 2, 4, 2, 3).tick.times do
      sample :drum_snare_hard, amp: 1, rate: (ring 1.8, 1.3).look, amp: 0.5
      sample :drum_cymbal_closed, amp: 0.6
      sleep 0.12
    end
    sample :drum_snare_soft, amp: 0.5
    sleep [0.2, 0.15].look * 2.1
  end
  #live_loop :synth, sync: :drums do
  (ring 48, 32).choose.times do
    
    with_fx :flanger, phase: 0.6 do
      sample :elec_tick, rate: (ring 0.2, 0.4, 0.3, 0.5, 0.7, 0.6, 0.5).choose*1.1, amp: 0.9
      sleep 0.12
    end
  end
  sleep 2
end


live_loop :beat do
  sample :bd_haus, amp: 1.5
  sleep (ring 0.5, 1.0).tick
end




live_loop :bass, sync: :drums do
  tick
  with_fx :distortion, phase: (ring 0.25, 0.5, 0.75).look do
    sample :bass_dnb_f, rate: (ring 0.6, 0.8, 0.7).look, attack: 0.5, release: 0.7, amp: 0.25
    sleep (ring 0.25, 0.4).look
  end
end

live_loop :sample, sync: :drums do
  tick
  (ring 1, 2, 3).look.times do
    sample :loop_weirdo, rate: (ring 0.9, -0.9, 1.3).look, attack: 1.3, start: (ring 0, 0.2).choose, finish: (ring 1.0, 0.5).look, amp: 0.8
    sleep 1.0
  end
  sample (ring :elec_blip2, :elec_blip).look
  sleep 6
end

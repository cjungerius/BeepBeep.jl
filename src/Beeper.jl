module Beeper
using WAV
using Downloads
using Random
export beep

sounddir = joinpath(splitdir(dirname(pathof(Beeper)))[1], "sounds")

sounds = (ping="microwave_ping_mono.wav",
    coin="smb_coin.wav",
    fanfare="victory_fanfare_mono.wav",
    complete="work_complete.wav",
    treasure="new_item.wav",
    ready="ready_master.wav",
    shotgun="shotgun.wav",
    mario="smb_stage_clear.wav",
    wilhelm="wilhelm.wav",
    facebook="facebook.wav",
    sword="sword.wav")

function beep(n::Int=1)
    soundpath = joinpath(sounddir, sounds[n])
    wavplay(soundpath)

end

function beep(n::String)
    if Symbol(n) in keys(sounds)
        soundpath = joinpath(sounddir, sounds[Symbol(n)])
        wavplay(soundpath)
    elseif ispath(n) && occursin(r".wav^",n)
        wavplay(n)
    elseif (occursin(r"^http://",n) || occursin(r"^https://",n)) && occursin(r".wav$",n)
        soundpath = Downloads.download(n,joinpath(mktempdir(),"sound.wav"))
        wavplay(soundpath)
    else
        println("Cannot parse string as sound name, filepath, or url; playing random sound!")
        n=rand(1:11)
        beep(n)
    end
end

function beep(n::Any...)
    println("Unknown argument(s): playing random sound!")
    n = rand(1:11)
    beep(n)
end
    
end
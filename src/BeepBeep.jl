module BeepBeep
using WAV
using Downloads
using Random
export beep, @beep

sounddir = joinpath(splitdir(dirname(pathof(BeepBeep)))[1], "sounds")

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

    (n < length(sounds) && n > 0) ? nothing : n = (println("Out of range: Playing random sound!"); rand(1:length(sounds)));    
    
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
        n=rand(1:length(sounds))
        beep(n)
    end
end

function beep(n::Any...)
    println("Unknown argument(s): playing random sound!")
    n = rand(1:length(sounds))
    beep(n)
end


macro beep(n, exp)
    quote
        local val = $(esc(exp))
        beep($n)
        val
    end
end

macro beep(exp)
    quote
        local val = $(esc(exp))
        local n = rand(1:length($sounds))
        beep(n)
        val
    end
end

end
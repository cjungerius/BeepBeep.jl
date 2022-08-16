using BeepBeep
using Test

@testset "BeepBeep.jl" begin
    @test typeof(BeepBeep.sounds) <: NamedTuple
    @test ispath(BeepBeep.sounddir)
    @test_logs (:warn, "Out of range: Playing random sound!") beep(0)
    @test_logs (:warn, "Out of range: Playing random sound!") beep(12)
    @test_logs (:warn, "Cannot parse string as sound name, filepath, or url; playing random sound!") beep("foobar")
    @test_logs (:warn, "Unknown argument(s): playing random sound!") beep(1.5)
    @test @beep true
    @test @beep 2 true
end

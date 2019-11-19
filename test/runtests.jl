using CoolPropExtensions
using Test

@testset "CoolPropExtensions.jl" begin
    atm = 101325
    constant_pressure_specific_heat = CoolPropExtensions.Property("C")
    pressuretemperature = CoolPropExtensions.InputPair("PT_INPUTS")
    water = CoolPropExtensions.WorkingFluid("HEOS","Water")
    CoolPropExtensions.update(water, pressuretemperature, 101325, 300)
    c_p = CoolPropExtensions.keyed_output(water,
        constant_pressure_specific_heat)
    @test c_p≈4180.6357765560715
    mass_density = CoolPropExtensions.Property("Dmass")
    pressure = CoolPropExtensions.Property("P")
    temperature = CoolPropExtensions.Property("T")
    pd = CoolPropExtensions.first_partial_deriv(water,
        mass_density, pressure, temperature)
    @test pd≈4.489626212601196e-7
    work = CoolPropExtensions.isothermalwork(WorkingFluid("HEOS","Water"),
        300.0, 10atm, 100atm, rtol=1e-8)
    @test work ≈ 9128.426693091658
end

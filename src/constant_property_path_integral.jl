const density = Property("D")
const pressuretemperature = InputPair("PT_INPUTS")



function isothermalwork(fluid::WorkingFluid,
                        temperature,
                        pressure_initial,
                        pressure_final;
                        rtol=1e-8)
    function ρ(fluid,pressure,temperature)
        update(fluid, pressuretemperature, pressure, temperature)
        keyed_output(fluid, density)
    end
    integeral, err = quadgk(x->1/ρ(fluid,x,temperature),pressure_initial,pressure_final,rtol=rtol)
    integeral
end

function adiabaticwork(fluid::WorkingFluid,
                       pressure_initial,
                       temperature_initial,
                       temperature_final;
                       rtol=1e-8)

end

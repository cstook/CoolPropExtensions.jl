const density = Property("D")
const pressuretemperature = InputPair("PT_INPUTS")

function isothermalwork(fluid::WorkingFluid, temperature, pressure_initial, pressure_final; rtol=1e-8)
    function ρ(pressure,fluid)
        update(fluid, pressuretemperature, pressure, temperature)
        keyed_output(fluid, density)
    end
    integeral, err = quadgk(x->1/ρ(x,fluid),pressure_initial,pressure_final,rtol)
    integeral
end

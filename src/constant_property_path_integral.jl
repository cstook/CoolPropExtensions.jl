const density = Property("D")
const pressuretemperature = InputPair("PT_INPUTS")

function isothermalwork(fluid::WorkingFluid,
                        temperature,
                        pressure_initial,
                        pressure_final;
                        rtol=1e-8)
    function abc(fluid,pressure)
        update(fluid, pressuretemperature, pressure, temperature)
        keyed_output(fluid, density)
    end
    integeral, err = quadgk(x->1/abc(fluid,x),pressure_initial,pressure_final,rtol)
    integeral
end

function adiabaticwork(fluid::WorkingFluid,
                       pressure_initial,
                       temperature_initial,
                       temperature_final;
                       rtol=1e-8)
    update(fluid, pressuretemperature, pressure, temperature)

end

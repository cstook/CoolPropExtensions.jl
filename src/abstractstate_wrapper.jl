function update(fluid::WorkingFluid, inputpair::InputPair, input1::Real, input2::Real)
    CoolProp.AbstractState_update(fluid.handle, inputpair.v, input1, input2)
end

function keyed_output(fluid::WorkingFluid, output::Property)
    CoolProp.AbstractState_keyed_output(fluid.handle, output.v)
end

function first_partial_deriv(fluid::WorkingFluid,
                             of::Property,
                             with_respect_to::Property,
                             constant::Property )
    CoolProp.AbstractState_first_partial_deriv(
        fluid.handle,
        of.v,
        with_respect_to.v,
        constant.v)
end

function free(fluid::WorkingFluid)
    CoolProp.AbstractState_free(fluid.handle)
end

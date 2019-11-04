module CoolPropExtensions
import CoolProp
using QuadGK

export update, keyed_output, first_partial_deriv, free
export InputPair, Property, WorkingFluid

include("Types.jl")
include("abstractstate_wrapper.jl")
include("constant_property_path_integral.jl")

end # module

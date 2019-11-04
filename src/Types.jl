struct InputPair
    v :: Int32
    function InputPair(s::AbstractString)
        v = CoolProp.get_input_pair_index(s)
        new(v)
    end
end
Base.convert(::Type{Int32}, x::InputPair) = x.v

struct Property
    v :: Int32
    function Property(s::AbstractString)
        v = CoolProp.get_param_index(s)
        new(v)
    end
end
Base.convert(::Type{Int32}, x::Property) = x.v

struct WorkingFluid
    handle :: Int32
    function WorkingFluid(propertylibrary::AbstractString, fluid::AbstractString)
        handle = CoolProp.AbstractState_factory(propertylibrary, fluid)
        new(handle)
    end
end
Base.convert(::Type{Int32}, x::WorkingFluid) = x.handle

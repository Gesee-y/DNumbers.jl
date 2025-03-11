##################### core struct script ####################

"""
```
struct DNumber{T} where T <: Number <: Number
    frob_part :: T
    nil_part :: T
```

A structure to represent dual numbers.

## Constructors

`DNumber{T}(f::Number, n::Number) where T <: Number`

This create a new dual numbers, `f` and `n` will be converted to
type `T`

### Example 
```julia-doctest
julia> d = DNumbers{Int8}(34,89)
34 + 89e
julia> typeof(d)
DNumber{Int8}
```

`DNumber(f::Number, n::Number)`

This create a new dual numbers, the type parameter will be inferred fronlm
`f` and `n` types

### Example 
```julia-doctest
julia> d = DNumbers(34,89)
34 + 89e
julia> typeof(d)
DNumber{Int64}. # Or Int32 depending on your operating system
```
"""
struct DNumber{T} <: Number where T <: Number
    frob_part :: T
    nil_part :: T

    ## Constructors ##

    DNumber{T}(f::Number, n::Number) where T <: Number = begin
        return new(convert(T,f), convert(T,n))
    end
end

DNumber(f::Number, n::Number) = DNumbers{promote_type(typeof(f), typeof(n)}(f,n)
  

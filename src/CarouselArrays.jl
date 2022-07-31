"""
Created in February, 2022 by
[chifi - an open source software dynasty.](https://github.com/orgs/ChifiSource)
by team
[odd-data](https://github.com/orgs/ChifiSource/teams/odd-data)
This software is MIT-licensed.
### CarouselArrays
CarouselArrays are arrays that can be indexed below 1 and above the length of
the array.
"""
module CarouselArrays
import Base: push!, append!, deleteat!, getindex, setindex!, broadcast
import Base: length, keys, iterate

"""
### CarouselArray{T}
- dims::Vector{T}\n
A `CarouselArray` is an Array that can be indexed infinitely to one side or
another. The indexes will roll over into the other end of the `Vector` stored
within "dims".
##### example
```
mycarousel = CarouselArray([5, 10, 15, 20])

mycarousel[1]
5
mycarousel[0]
20
mycarousel[-1]
15
mycarousel[4]
20
mycarousel[5]
5
```
------------------
##### field info
- **dims** - The inner `Vector` of a `CarouselArray`.
------------------
##### constructors
- CarouselArray{T}()
- CarouselArray{T}(x::AbstractVector)
- CarouselArray(x::AbstractVector)
"""
mutable struct CarouselArray{T <: Any}
    dims::Vector{T}
    function CarouselArray(x::AbstractVector)::CarouselArray
        new{typeof(x).parameters[1]}(x)::CarouselArray
    end
    CarouselArray{T}() where {T <: Any} = new{T}(Vector{T}([]))
    CarouselArray{T}(x::AbstractVector) where {T <: Any} = new{T}(Vector{T}([x]))
end

iterate(ca::CarouselArray{<:Any}) = iterate(ca.dims)
iterate(ca::CarouselArray{<:Any}, i::Int64) = iterate(ca.dims, i)
push!(ca::CarouselArray{<:Any}, a::Any ...) = push!(ca.dims, a ...)
append!(ca::CarouselArray{<:Any}, a::Any) = append!(ca.dims, a)
deleteat!(ca::CarouselArray{<:Any}, i::Int64) = deleteat!(ca.dims, i)
keys(ca::CarouselArray{<:Any}) = keys(ca.dims)
length(ca::CarouselArray{<:Any}) = length(ca.dims)

function getindex(ca::CarouselArray{<:Any}, i::Int64)
    if i < 1
        getindex(ca, length(ca) - abs(i))
    elseif i > length(ca)
        getindex(ca, mod(i, length(ca)))
    else
        ca.dims[i]
    end
end

function setindex!(ca::CarouselArray{<:Any}, v::Any, i::Int64)
    if i < 1
        setindex!(ca, v, length(ca) - abs(i))
    elseif i > length(ca)
        setindex!(ca, v, mod(i, length(ca)))
    else
        ca.dims[i] = v
    end
end
export CarouselArray
end # module

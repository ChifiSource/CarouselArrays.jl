<div align = "center">
  <img src = https://github.com/ChifiSource/image_dump/blob/main/odddata/carousel.png  width = 200/img>
  <h6>Carousel Arrays</h6>
  <div align = "left">
  
Carousel Arrays are Arrays that can be indexed repeatedly. Indexes below 1 will index starting with the end of the Vector, and indexes above the length of the Vector will index the beginning of the Vector.
```julia
julia> using CarouselArrays

julia> c = CarouselArray([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])
CarouselArray{Int64}([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

julia> c[25]
5

julia> c[-8]
2

julia> c[-2]
8

julia> c[0]
10

```


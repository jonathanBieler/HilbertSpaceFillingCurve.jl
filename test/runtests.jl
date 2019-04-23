using HilbertSpaceFillingCurve
using Test

@testset "hilbert" begin

d = 10
for ndims in 2:3, nbits in [8,16]
    p = hilbert(d, ndims, nbits)
    @test d == hilbert(p, ndims, nbits)
end

@test_throws AssertionError hilbert(d, 2, 64)

end
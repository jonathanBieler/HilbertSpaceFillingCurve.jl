using BinDeps
using Compat

@BinDeps.setup

libhilbert = library_dependency("libhilbert")

builddir = joinpath(Pkg.dir(),"HilbertSpaceFillingCurve","src","lib")

provides(SimpleBuild,
    (@build_steps begin
        ChangeDirectory( builddir )
        @build_steps begin
            `make`
        end
    end), 
libhilbert, installed_libpath=builddir)

@BinDeps.install Dict(
    "libhilbert" => "libhilbert",
)

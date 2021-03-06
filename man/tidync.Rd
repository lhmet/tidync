% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tidync.R
\name{tidync}
\alias{tidync}
\alias{tidync}
\alias{tidync.character}
\title{tidy netcdf}
\usage{
tidync(x, what, ...)

\method{tidync}{character}(x, what, ...)
}
\arguments{
\item{x}{path to a NetCDF file}

\item{what}{(optional) character name of grid (see \code{ncmeta::nc_grids}) or (bare) name of variable (see \code{ncmeta::nc_vars}) or index of grid to \code{activate}}

\item{...}{reserved for arguments to methods, currently ignored}
}
\description{
Function to extract all metadata from a NetCDF, for use in subsequent operations. By default
the first \emph{shape} encountered is  \code{activate}d.
}
\details{
Any NetCDF with variable arrays should work. Files with compound types are not yet supported and
should fail gracefully.

We haven't yet explored HDF5 per se, so any feedback is appreciated. Major
use of compound types is made by \url{https://github.com/sosoc/croc}
}
\examples{
## a SeaWiFS (S) Level-3 Mapped (L3m) monthly (MO) chlorophyll-a (CHL)
## remote sensing product at 9km resolution (at the equator)
## from the NASA ocean colour group in NetCDF4 format (.nc)
## for 31 day period January 2008 (S20080012008031) 
f <- "S20080012008031.L3m_MO_CHL_chlor_a_9km.nc"
l3file <- system.file("extdata/oceandata", f, package= "tidync")
tnc <- tidync(l3file)
print(tnc)

## very simple Unidata example file, with one dimension
\dontrun{
uf <- system.file("extdata/unidata", "test_hgroups.nc", package = "tidync")
recNum <- tidync(uf) \%>\% hyper_tibble()
print(recNum)
}
## a raw grid of Southern Ocean sea ice concentration from IFREMER
## it is 12.5km resolution passive microwave concentration values
## on a polar stereographic grid, on 2 October 2017, displaying the 
## "hole in the ice" made famous here:
## https://tinyurl.com/ycbchcgn
ifr <- system.file("extdata/ifremer", "20171002.nc", package = "tidync")
ifrnc <- tidync(ifr)
ifrnc \%>\% hyper_tibble(select_var = "concentration")
}

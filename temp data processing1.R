#using netcdf 
library(ncdf4) # package for netcdf manipulation
library(raster) # package for raster manipulation
library(rgdal) # package for geospatial analysis
library(ggplot2) # package for plotting

fname <- "~/Downloads/air.mon.mean.nc"
HadISST.b <- brick(fname)  
HadISST.b
plot(HadISST.b[[1]])
dim(HadISST.b)

#nc_df <- as.data.frame(HadISST.b, xy=T)
nc_df <- as.data.frame(HadISST.b, xy = TRUE, na.rm = TRUE)

write.csv(nc_df, "~/Downloads/total_temp.csv")

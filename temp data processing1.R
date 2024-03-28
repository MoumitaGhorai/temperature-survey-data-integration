#using netcdf 
library(ncdf4) # package for netcdf manipulation
library(raster) # package for raster manipulation
library(rgdal) # package for geospatial analysis
library(ggplot2) # package for plotting

fname <- "C:/Users/moumi/Downloads/air.mon.mean (1).nc"
HadISST.b <- brick(fname)  
HadISST.b
plot(HadISST.b[[1]])
dim(HadISST.b)

#nc_df <- as.data.frame(HadISST.b, xy=T)
nc_df <- as.data.frame(HadISST.b, xy = TRUE, na.rm = TRUE)

write.csv(nc_df, "C:/Users/moumi/Downloads/practicefilename5.csv")

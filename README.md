# temperature-and-survey-codes


1.  download temperature file from https://psl.noaa.gov/data/gridded/data.ghcncams.html
2.  Use the r-code for extracting data
3.  then use the python codebook for merging with the DHS GPS data
4.  join the merged file with the DHS PR data. (the file ends up being 11/12 gb each)
5.  keep only the variables necessary and append the 2016 and 2021 file
6.  contract the temperature variable (degree days measurement)

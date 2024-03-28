# temperature-and-survey-codes


1.  download temperature file from https://psl.noaa.gov/data/gridded/data.ghcncams.html
2.  Use the r-code for extracting data. 
3.  then use the python codebook for merging with the DHS GPS data. I used nearest neighborhood matching method. Matched each temp grid with closest cluster point.
5.  join the merged file with the DHS IR data and append the files together.
7.  construct the temperature variable (degree days measurement for last one year, #of days over 30C in last one year)

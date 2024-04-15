final_append <- read.csv("C:/Users/moumi/Desktop/India temp project/DHS survey data/final clean data/final_append.csv")
df<-data.frame(final_append)

# Load the dplyr package
library(dplyr)

# Select columns that start with 'month' and subtract 273.15 from them
df <- df %>%
  mutate(across(starts_with("month"), ~ . - 273.15))


#tvar3: degree-month measurement for the whole year prior to the interview
df<-data.frame(df)

colnames(df)
df$tvar3<-NA
for (i in 1:dim(df)[1]){
  
  a2<-df$v008[i]
  a3<- a2-12
  
  sumtemp<-vector()
  
  for (j in 0:12) {
    damju<- df[i,paste0("month", eval(a3+j))]
    sumtemp<-c(sumtemp,damju)
  }
  
  #turn values less than 25 into NAs
  for (m in 1:length(sumtemp)) {
    if (sumtemp[m] < 25) {
      sumtemp[m] <- NA
    } 
  }
  
  #drop NAs, subtract 25 from every value and create sum of temp above 25
  sumtemp<-sumtemp[!is.na(sumtemp)]
  
  for (n in 1:length(sumtemp)) {
    sumtemp[n]<-sumtemp[n]-25
  }
  
  df$tvar3[i]<- sum(sumtemp, na.rm = TRUE)
}

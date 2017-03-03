# different conversion used
# as.character to change factor to character
# as.date to change character to date
# as.POSIXct to change date for comparision

for(i in 1:2224){
  sdate <- sampl2$Survey.Start.Date[i] #storing date value of Survey. start.date
  sdate2 <- sampl2$Survey.End.Date[i] #storing date value of Survey. end.date
  sdate2 <- sdate2 + 86400 #for entries/tab.no recorded after survey end date
  for (j in 1 : 21531){
    sdate3 <- sampl1$Survey.Date[j]
    if (sampl1$Tab.No[j]==sampl2$Tab.No[i]){ # comparing Tab.No.
    if (sdate3 >= sdate){ # comparing survey date
      if (sdate3 <= sdate2){ # comparing survey date with end date
         sampl1$AC.Name[j] <- sampl2$AC.Name[i] # storing values
         sampl1$Mandal.Name[j] <- sampl2$Mandal.Name[i]
         sampl1$Village.Name[j] <- sampl2$Village.Name[i]
      }
      
    }
    }
    j <- j + 1 #value incrementor for loop
  }
  i <- i + 1
}
write.csv2(sampl1,file="dataset")

# sampl1 is the dataset imported from sheet1
# sampl2 is the dataset imported from sheet2
# sdate(2,3) are the vectors storing values of date for comparision
# data stored in sampl1
# and written in dataset as csv2
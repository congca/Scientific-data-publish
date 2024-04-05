 
library(tibble)
library(readr)
#### traffic.csv #####
Oslo <- read.table("Kirkeveien Oslo traffic.csv",header=T,sep=";")
Oslo <- Oslo[which(Oslo[,7] %in% "Totalt"),]
TRAFFIC <- TRAFFIC[,8]
TRAFFIC <- Oslo[,8]
Bergen <- read.table("Danmarks plass Bergen traffic.csv",header=F,sep=",")
Bergen <- Bergen[which(Bergen[,7] %in% "Totalt"),]
Trondheim <- read.table("bakke kirke Trondheim traiffc.csv",header=T,sep=";")
Trondheim <- Trondheim[which(Trondheim[,7] %in% "Totalt"),]
Stavanger <- read.table("stavanger.csv",header=T,sep=";")
Stavanger <- Stavanger[which(Stavanger[,7] %in% "Totalt"),]
Tromso <- read.table("tROMSO.csv",header=T,sep=";")
Tromso <- Tromso[which(Tromso[,7] %in% "Totalt"),]
Fredirstad <- read.table("Fredirkstad.csv",header=T,sep=";")
Fredirstad <- Fredirstad[which(Fredirstad[,7] %in% "Totalt"),]
Oslo <- read.table("Kirkeveien Oslo traffic.csv",header=F,sep=",")
Oslo <- Oslo[which(Oslo[,7] %in% "Totalt"),]
write.table(Oslo, file = "Oslo.xlsx", append = FALSE, quote = TRUE, sep = "; ")
write.table(Oslo[,c(4,8)], file = "Oslo.csv",sep="")
Bergen <- Bergen[,c(4,8)]
write.table(Bergen, file = "Bergen.csv",sep="")
Trondheim <- Trondheim[,c(4,8)]
write.table(Trondheim, file = "Trondheim.csv",sep="")
Stavanger <- read.table("stavanger.csv",header=T,sep=";")
Stavanger <- Stavanger[which(Stavanger[,7] %in% "Totalt"),]
Stavanger <- Stavanger[,c(4,8)]
Tromso <- read.table("tROMSO.csv",header=T,sep=";")
Tromso <- Tromso[which(Tromso[,7] %in% "Totalt"),]
Tromso <- Tromso[,c(4,8)]
#### Pollution #####
Bergen <- read.table("Danmarks plass Bergen pollution.csv",header=T,sep=";")
Trondheim <- read.table("bakke kirke Trondheim pollution.csv",header=T,sep=";")
Stavanger <- read.table("kannik stavenger pollution.csv",header=T,sep=";")
Oslo <- read.table("Kirkeveien Olso pollution.csv",header=T,sep=";")
Bergen <- read.table("Danmarks plass Bergen pollution.csv",header=T,sep=";")
Trondheim <- read.table("bakke kirke Trondheim pollution.csv",header=T,sep=";")
Stavanger <- read.table("kannik stavenger pollution.csv",header=T,sep=";")
Tromso <- read.table("Tromso Hansjordnesbukta pollution.csv",header=T,sep=";")
pollution <- rbind(Oslo,Bergen,Trondheim,Stavanger,Tromso)
pollution <- round(pollution)
write.table(pollution[,c(1,2,4)], file = "pollution.csv",sep="")
#Done#

      
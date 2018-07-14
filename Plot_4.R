#Plot_4
getwd()
setwd("/Users/Bryant 1/Documents/DataScience")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")
coalNEISCC <- grepl("coal", NEISCC$Short.Name, ignore.case=TRUE)
coalinNEISCC <- NEISCC[coalNEISCC, ]
library(ggplot2)
aggrbyyear <- aggregate(Emissions ~ year, coalinNEISCC, sum)

g <- ggplot(aggrbyyear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from coal between 1999 and 2008')
plot(g)
dev.copy(png, file = "plot_4.png",width=480,height=480,units="px",bg="transparent")
dev.off()

#Plot_5
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEISCC <- merge(NEI, SCC, by="SCC")

BaltNEI <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]
Baltaggrbyyear <- aggregate(Emissions ~ year, BaltNEI, sum)

g <- ggplot(Baltaggrbyyear, aes(factor(year), Emissions))
g <- g + geom_bar(stat="Identity") + xlab("Year") +
  ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore, Maryland (fips = "24510") between 1999 and 2008')
print(g)
dev.copy(png, file = "plot_5.png",width=480,height=480,units="px",bg="transparent")
dev.off()

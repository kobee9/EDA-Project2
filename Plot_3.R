#Plot_3
library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltNEI <- NEI[NEI$fips=="24510",]
png("Plot_3.png",width=480,height=480,units="px",bg="transparent")
gp <- ggplot(baltNEI,aes(factor(year),Emissions,fill=type)) + geom_bar(stat="identity") +
  theme_bw() + guides(fill=FALSE)+ facet_grid(.~type,scales = "free",space="free") + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission (Tons)")) + 
  labs(title=expression("PM"[2.5]*" Emissions, Baltimore by Type 1999-2008"))
print(gp)
dev.off()

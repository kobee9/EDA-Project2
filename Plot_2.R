#Plot_2
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltNEI <- NEI[NEI$fips=="24510",]
totalinbalt <- aggregate(Emissions ~ year, baltNEI ,sum)
barplot(height=totalinbalt$Emissions, names.arg=totalinbalt$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in Baltimore, MD emissions at various years'))
dev.copy(png, file = "plot_2.png",width=480,height=480,units="px",bg="transparent")
dev.off()

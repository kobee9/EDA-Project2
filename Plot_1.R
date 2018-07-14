#Plot_1
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totalbyyear <- aggregate(Emissions ~ year,NEI, sum)
barplot(height=totalbyyear$Emissions, names.arg=totalbyyear$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))
dev.copy(png, file = "plot_1.png",width=480,height=480,units="px",bg="transparent")
dev.off()

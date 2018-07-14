#Plot_6
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

Sccvehi <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
Sccvehicles <- SCC[Sccvehi,]$SCC
NEIvehicles <- NEI[NEI$SCC %in% Sccvehicles,]

BalNEIvehicles <- NEIvehicles[NEIvehicles$fips=="24510",]
BalNEIvehicles$city <- "Baltimore City"
LANEIvehicles <- NEIvehicles[NEIvehicles$fips=="06037",]
LANEIvehicles$city <- "Los Angeles City"
BalLANEI <- rbind(BalNEIvehicles,LANEIvehicles)

g <- ggplot(BalLANEI, aes(x=factor(year), y=Emissions, fill=city)) +
  geom_bar(aes(fill=city),stat="identity") + facet_grid(scales="free", space="free", .~city) + guides(fill=FALSE) + theme_bw() + labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
  labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA between 1999 and 2008"))

print(g)

dev.copy(png, file = "plot_6.png",width=480,height=480,units="px",bg="transparent")
dev.off()
